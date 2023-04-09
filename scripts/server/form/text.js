import { world } from "@minecraft/server";
import * as UI from '@minecraft/server-ui';
import { config } from '../data.js';

let datas = config.Rolls
let setting = config.setting
let member

export class FORM {
  static async gameinfo(user) {
    let PLs = world.getAllPlayers()
    let PLc = PLs.filter(n => n.hasTag("player"))
    const form = new UI.ActionFormData()
      .title('指令は？')
      .button('ゲーム開始')
      .button(`プレイヤー ${PLc.length}/${PLs.length}`)
      .button('ゲーム中断')
      .button(`役職編成\n${datas.length}枠設定済み`)
      .button(`設定`);
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    // userのrollを取得

    if (selection === 0) this.gamestart(user);
    if (selection === 1) return await this.GetPlayers(user);
    if (selection === 2) user.runCommandAsync("function werewolf/onfinish/clean_up");
    if (selection === 3) return await this.rollinfo(user);
    if (selection === 4) return await this.setting(user);
  }


  static async gamestart(user) {
    if (datas.length > 2) {
      let PLs = world.getAllPlayers()
      user.runCommandAsync("function werewolf/start_First")
      
      user.runCommandAsync("scoreboard players set MWSystem time " + setting.time)
      user.runCommandAsync("scoreboard players set クォーツ間隔 time " + setting.quartz)
      user.runCommandAsync("scoreboard players set 怪盗リミット time " + setting.thief)

      for (let data of datas) {
        user.runCommandAsync("execute as @r[tag=player,scores={CurrentRole=0}] run scoreboard players set @s CurrentRole " + data.score)
      }
      if (setting.lover > 0) {
        for (let i = 1; i <= setting.lover; ++i) {
          user.runCommandAsync("scoreboard players set @r[scores={lover=0}] lover " + i)
          user.runCommandAsync("scoreboard players set @r[scores={lover=0}] lover " + i)
        }
      }
      if (setting.item) user.runCommandAsync("function werewolf/onstart/give_items")
      if (setting.tp) {
        user.runCommandAsync("tp @a @s")
        user.runCommandAsync("effect @a invisibility 10 0 true")
        user.runCommandAsync("effect @a resistance 10 10 true")
      }
      user.runCommandAsync("function werewolf/start_Latter")
      user.runCommandAsync(`tellraw @a[scores={CurrentRole=6}] {"rawtext":[{"text":"§7怪盗は${setting.thief}秒以降、役職を盗めなくなります注意してください"}]}`)
      user.runCommandAsync('tellraw @a[scores={CurrentRole=9}] {"rawtext":[{"text":"人狼一覧:"},{"selector":"@a[scores={team=1}]"}]}')
      if (setting.Fanatic) user.runCommandAsync('tellraw @a[scores={CurrentRole=9}] {"rawtext":[{"text":"白人外一覧:"},{"selector":"@a[scores={team=2}]"}]}')

      for (let PL of PLs) { if (PL.hasTag("player")) member.push(PL) }
    } else { world.say("ロールが少なすぎます！\n" + datas.length + ">2") }
  }

  static async GetPlayers(user) {
    let PLs = world.getAllPlayers()
    let PLc = PLs.filter(n => n.hasTag("player"));
    const form = new UI.ActionFormData()
      .title(`参加状態の変更 ${PLc.length}/${PLs.length}人`).button(`全員を参加状態にする`);
    let i = 0
    for (let PL of PLs) {
      let status = "c待機中"
      i = i + 1
      if (PL.hasTag("player")) status = "a参加中"
      form.button(`${i}:${PL.nameTag}\n§${status}`)
    }
    form.button('戻る');
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    var ans = selection - 1
    if (ans == -1) {
      for (let PL of PLs) { PL.addTag("player") }
      return await this.GetPlayers(user)
    }
    if (ans == i) return await this.gameinfo(user)
    if (PLs[ans].hasTag("player")) {
      PLs[ans].removeTag("player")
    } else { PLs[ans].addTag("player") }
    return await this.GetPlayers(user)
  }

  static async rollinfo(user) {
    const form = new UI.ActionFormData()
      .title('ロールを編成(選択で削除)');
    let i = 0
    if (datas.length > 0) {
      for (let data of datas) {
        i = i + 1
        form.button(`${i}:${data.name}`)
      }
    }
    form.button('役職追加')
      .button("戻る")
      .button("ヘルプ");
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection === i) {
      return await this.add_rollinfo(user)
    }
    if (selection === i + 1) {
      return await this.gameinfo(user)
    }
    if (selection === i + 2) {
      const form = new UI.ActionFormData()
        .title('ヘルプ(ロール)')
        .body("上から順にプレイヤーに割り当てられる\n例:プレイヤー3人 「1:人狼,2:村人,3:預言者,4:霊媒師」の場合\n「人狼,村人,預言者」が割り当てられる\n\n設定した枠を超えた場合は村人が割り当てられる\n例:プレイヤー3人 「1:人狼,2:預言者」の場合\n「人狼,預言者,村人」が割り当てられる")
        .button("戻る");
      const { selection, canceled } = await form.show(user);
      if (canceled) return;
      return await this.rollinfo(user)
    }
    datas.splice(selection, 1)
    return await this.rollinfo(user)
  }

  static async add_rollinfo(user) {
    const form = new UI.ActionFormData()
      .title('役職追加');
    let Initials = config.Initial
    Initials = Initials.filter(role => role.name !== "観戦");
    let i = 0
    for (let Initial of Initials) {
      form.button(`${Initial.name}\n${Initial.text}`)
      i = i + 1
    }
    form.button("戻る")
    const { selection, canceled } = await form.show(user);

    if (canceled) return;
    if (selection == i) {
      return await this.rollinfo(user)
    }
    datas.push(Initials[selection])
    return await this.rollinfo(user)
  }

  static async setting(user) {
    function Cif(ev) { if (ev) { return "§atrue" } else { return "§cfalse" } }
    var Dm
    if (user.hasTag("Debugger")) { Dm = "§aon" } else { Dm = "§coff" }
    const form = new UI.ActionFormData()
      .title('設定')
      .button(`初期アイテム\n${Cif(setting.item)}`)
      .button(`恋人\n${setting.lover}組`)
      .button(`スタート時に自分へ全員をTPする\n${Cif(setting.tp)}`)
      .button(`教信者が人狼陣営を全て見える\n${Cif(setting.Fanatic)}`)
      .button(`怪盗が役職を盗める時間\n${setting.thief}秒以前`)
      .button(`クォーツ全配布までの時間\n${setting.time}秒`)
      .button(`クォーツ配布の間隔\n${setting.quartz}秒おき`)
      .button(`デバッグ\n${Dm}`)
      .button(`戻る`);
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == 0) if (setting.item) { setting.item = false } else { setting.item = true }
    if (selection == 1) if (setting.lover < 5) { setting.lover = setting.lover + 1 } else { setting.lover = 0 }
    if (selection == 2) if (setting.tp) { setting.tp = false } else { setting.tp = true }
    if (selection == 3) if (setting.Fanatic) { setting.Fanatic = false } else { setting.Fanatic = true }
    if (selection == 4) if (setting.thief < 600) { setting.thief = setting.thief + 150 } else { setting.thief = 0 }
    if (selection == 5) return await this.setting_time(user)
    if (selection == 6) if (setting.quartz < 400) { setting.thief = setting.quartz + 50 } else { setting.quartz = 50 }
    if (selection == 7) { if (user.hasTag("Debugger")) { user.removeTag("Debugger") } else { user.addTag("Debugger") } }
    if (selection == 8) return await this.gameinfo(user)
    return await this.setting(user)
  }

  static async setting_time(user) {
    const form = new UI.ActionFormData()
      .title('設定_時間').body(setting.time + "秒")
      .button(`+300`)
      .button(`+50`)
      .button(`-50`)
      .button(`-300`)
      .button(`戻る`);
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == 0) setting.time = setting.time + 300
    if (selection == 1) setting.time = setting.time + 50
    if (selection == 2) setting.time = setting.time - 50
    if (selection == 3) setting.time = setting.time - 300
    if (selection == 4) return await this.setting(user)
    if (setting.time <= 0) setting.time = 50
    if (setting.time > 1800) setting.time = 1800
    return await this.setting_time(user)
  }

  static async werewolf(user) {
    const form = new UI.ActionFormData()
      .title('妨害せよ')
      .button('停電')
      .button('ランダムアイテム')
      .button('最も遠いプレイヤーへ転移')
      .button('人狼へ転移');
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    // userのrollを取得
    let PL = world.getAllPlayers().find(e => e.id === user.id);

    if (selection === 0) {
      user.runCommandAsync(`effect @a[name=!"${PL.name}",m=a] blindness 10 0 false`)
      user.runCommandAsync("title @a times 5 20 10")
      user.runCommandAsync("title @a title 停 電 発 生")
      user.runCommandAsync("title @a subtitle 10秒後に復旧します")
      user.runCommandAsync("playsound mob.wither.spawn @a ~ ~ ~ 100 1 100");
    }
    if (selection === 1) {
      const form = new UI.ActionFormData()
        .title('妨害せよ')
        .button('完全ランダム')
        .button('殺傷ランダム\nローズ/即死ポーション/地雷');
      const { selection, canceled } = await form.show(user);
      if (canceled) return;
      if (selection === 0) {
        user.runCommandAsync("scoreboard players reset @a give_item")
        user.runCommandAsync("scoreboard players random @s give_item 1 10")
        user.runCommandAsync("function werewolf/onstart/give_items")
      }
      if (selection == 1) {
        let random = [6, 5, -1]
        user.runCommandAsync("scoreboard players reset @a give_item")
        user.runCommandAsync("scoreboard players set @s give_item " + random[Math.floor(Math.random() * 3)])
        user.runCommandAsync("function werewolf/onstart/give_items")
      }
    }
    if (selection === 2) {
      user.runCommandAsync("effect @s[hasitem={item=bow,quantity=0}] invisibility 10 0")
      user.runCommandAsync(`tp @s @a[c=-1,name=!"${PL.name}",scores={a_live=1..}]`)
      user.runCommandAsync("playsound portal.travel @a ~~~ 100 1 100")
    }
    if (selection === 3) {
      user.runCommandAsync("effect @s invisibility 10 0")
      user.runCommandAsync(`tp @s @a[c=-1,name=!"${PL.name}",scores={team=1}]`)
      user.runCommandAsync("playsound portal.travel @a ~~~ 30 1 100")
    }
    user.runCommandAsync("clear @s diamond 0 1")
  }

  // 預言者
  static async divination(user) {
    let team = world.scoreboard.getObjective("CurrentRole")
    let PLs = team.getParticipants()
    let anPLs = []
    for (let PL of PLs) {
      let score = team.getScore(PL)
      if (Number(score) > 0) anPLs.push(PL)
    }

    const form = new UI.ActionFormData()
      .title('誰を占う？');
    anPLs.forEach(PL => {
      form.button(world.getAllPlayers().find(e => e.name === PL.displayName).nameTag)
    });
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    let reply = team.getScore(PLs[selection])
    let answer = "白"

    // userのrollを取得
    let PL = world.getAllPlayers().find(e => e.id === user.id);
    let userroll
    for (let score of team.getScores()) {
      if (score.participant.displayName === PL.name) { userroll = score.score }
    }

    // rollが見かけ上は予言だが、本当は違った場合用
    // 例：偽占い 怪盗に進まれた占い
    if (userroll == 3) {
      if (reply == 1 || reply == 11 || reply == 14) { answer = "黒" }
      if (reply == 8) { user.runCommandAsync(`kill "${PLs[selection].displayName}"`) }
    } else {
      answer = "白"
    }
    user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"${PLs[selection].displayName}は${answer}です"}]}`)
    user.runCommandAsync("clear @s diamond 0 1")
  }

  // 霊媒師
  static async psychic(user) {
    let team = world.scoreboard.getObjective("CurrentRole")
    let PLs = team.getParticipants()
    let anPLs = []
    for (let PL of PLs) {
      let score = team.getScore(PL)
      if (Number(score) > 0) {
        anPLs.push(PL)
      }
    }
    const form = new UI.ActionFormData()
      .title('誰を霊界から呼ぶ？');
    anPLs.forEach(PL => {
      form.button(PL.displayName)
    });
    const { selection, canceled } = await form.show(user);
    if (canceled) return;

    // 対象の生死を取得
    let a_live = world.scoreboard.getObjective("a_live")
    let live
    for (let PL of a_live.getParticipants()) {
      if (PL.displayName == PLs[selection].displayName) { live = a_live.getScore(PL) }
    }

    let reply = team.getScore(PLs[selection])
    let answer = "は白です"

    // userのrollを取得
    let PL = world.getAllPlayers().find(e => e.id === user.id);
    let userroll
    for (let score of team.getScores()) {
      if (score.participant.displayName === PL.name) { userroll = score.score }
    }

    // rollが見かけ上は霊媒だが、本当は違った場合用
    // 例：怪盗に進まれた霊媒
    if (userroll == 4) {
      if (live == 0) {
        if (reply == 1 || reply == 10 || reply == 11) { answer = "は黒です" }
      } else { answer = "の魂は見つかりませんでした…" }
    } else { answer = "の魂は見つかりませんでした…" }
    user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"${PLs[selection].displayName}${answer}"}]}`)
    user.runCommandAsync("clear @s diamond 0 1")
  }

  // 怪盗
  static async thief(user) {
    let team = world.scoreboard.getObjective("CurrentRole")
    let PLs = team.getParticipants()
    let anPLs = []
    for (let PL of PLs) {
      let score = team.getScore(PL)
      if (Number(score) > 0) anPLs.push(PL)
    }
    const form = new UI.ActionFormData()
      .title('誰から盗む？');
    anPLs.forEach(PL => {
      form.button(PL.displayName)
    });
    const { selection, canceled } = await form.show(user);
    if (canceled) return;

    // 対象の生死を取得
    let a_live = world.scoreboard.getObjective("a_live")
    let live_PL = a_live.getParticipants()
    let live
    for (let PL of live_PL) {
      let score = a_live.getScore(PL)
      if (PL.displayName == PLs[selection].displayName) { live = score }
    }

    let reply = team.getScore(PLs[selection])
    let answer

    // userのrollを取得
    let PL = world.getAllPlayers().find(e => e.id === user.id);
    let userroll
    for (let score of team.getScores()) {
      if (score.participant.displayName === PL.name) { userroll = score.score }
    }

    // rollが見かけ上は怪盗だが、本当は違った場合用
    // 例：怪盗に進まれた怪盗(村人)
    if (userroll != 6) {
      user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"貴方の役職は村人です"}]}`)
      user.runCommandAsync("clear @s diamond 0 1")
      return
    }

    if (live == 1) {
      if (reply == 1) {
        answer = '人狼です\n人狼は"},{"selector":"@e[scores={team=1}]"},{"text":"'
        user.runCommandAsync(`tellraw @a[scores={CurrentRole=9}] {"rawtext":[{"text":"${PLs[selection].displayName}から"},{"selector":"@s"}]},{"text":"が人狼を盗みました"`)
      } else {
        if (reply == 9) {
          answer = '教信者です\n人狼は"},{"selector":"@e[scores={team=1}]"},{"text":"'
        } else { answer = config.Initial[reply].name }
      }
      user.runCommandAsync(`scoreboard players operation @s CurrentRole = "${PLs[selection].displayName}" CurrentRole`)
      user.runCommandAsync(`scoreboard players operation @s team = "${PLs[selection].displayName}" team`)
      user.runCommandAsync(`scoreboard players operation @s Previewteam = "${PLs[selection].displayName}" team`)
      user.runCommandAsync(`scoreboard players operation @s PreviewRole = @s CurrentRole`)
      user.runCommandAsync(`execute as @a[name="${PLs[selection].displayName}",hasitem={item=diamond}] run give "${PL.name}" diamond 1 0 {"item_lock":{"mode":"lock_in_inventory"}}`)
      user.runCommandAsync(`scoreboard players set "${PLs[selection].displayName}" CurrentRole 5`)
      user.runCommandAsync(`scoreboard players set "${PLs[selection].displayName}" team 3`)
      user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"貴方の役職は${answer}です"}]}`)
      user.runCommandAsync("clear @s diamond 0 1")
    } else {
      user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"死者からは盗めません"}]}`)
    }
  }

  static test() {
  }
  static async dokodemo_door(user) {
    let team = world.scoreboard.getObjective("a_live")
    let PLs = team.getParticipants()
    let anPLs = []
    for (let PL of PLs) {
      let score = team.getScore(PL)
      if (Number(score) > 0) anPLs.push(PL)
    }
    const form = new UI.ActionFormData()
      .title('どこへ行く？');
    anPLs.forEach(PL => {
      form.button(PL.displayName)
    });
  }

  static async QC(user) {
    const form = new UI.ActionFormData()
      .title('クイックチャット')
      .button("告発")
      .button("宣言")
      .button("質問")
      .button("回答")
      .button("要求")
      .button("プレイヤー");
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == 0) { this.QC_AC_1(user) }
    if (selection == 1) { this.QC_CO(user) }
    if (selection == 2) { this.QC_Q_1(user) }
    if (selection == 3) { this.QC_A(user) }
    if (selection == 4) { this.QC_R(user) }
    if (selection == 5) { this.QC_P(user) }
    return
  }
  static async QC_AC_1(user) {
    const form = new UI.ActionFormData().title('告発');
    let text = ["がBを殺した", "はBを騙した", "はBといた", "は嘘をついている", "が怪しい", "はCかもしれない", "はCだ", "は隠れている"]
    text.forEach(tx => { form.button("A" + tx) });
    form.button("戻る");
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == text.length) { this.QC(user) }
    if (selection < text.length) { this.QC_AC_2(user, text[selection]) }
    return
  }
  static async QC_AC_2(user, text) {
    let A = this.getPL()
    A.push({ nameTag: "誰か" })
    const form = new UI.ActionFormData().title("A" + text);
    A.forEach(PL => { form.button(PL.nameTag) });
    form.button("戻る");
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == A.length) { this.QC_AC_1(user) }
    if (selection < A.length) { if (text.match(/B|C/)) { this.QC_AC_3(user, text, A[selection], A) } else { user.runCommandAsync(`tellraw @a {"rawtext":[{"text":"<${user.nameTag}> ${A[selection].nameTag + text}"}]}`) } }
    return
  }
  static async QC_AC_3(user, text, A, B) {
    const form = new UI.ActionFormData().title(A.nameTag + text);
    let sel
    let At = text
    if (text.match(/B/)) {
      sel = B
      sel.forEach(PL => { form.button(PL.nameTag) });
      At = At.replace("B", "BorC")
    } else {
      sel = this.getRole()
      sel.push("白")
      sel.push("黒")
      sel.forEach(R => { form.button(R) });
      At = At.replace("C", "BorC")
    }
    form.button("戻る");
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == sel.length) { this.QC_AC_2(user, text) }
    if (selection < sel.length) {
      if (sel[selection]?.nameTag) { sel = sel[selection].nameTag } else { sel = sel[selection] }
      user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"<${user.nameTag}> ${A.nameTag + At.replace("BorC", sel)}"}]}`)
    }
    return
  }

  static async QC_CO(user) {
    let Role = this.getRole()
    const form = new UI.ActionFormData().title('宣言');
    Role.forEach(RL => { form.button(RL) });
    form.button("戻る");
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == Role.length) { this.QC(user) }
    if (selection < Role.length) { user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"<${user.nameTag}> ${Role[selection]}CO"}]}`) }
    return
  }

  static async QC_Q_1(user) {
    const form = new UI.ActionFormData().title('質問');
    let text = ["Aは何をしていた？", "Aと一緒にいたのは誰？", "Aはどこにいる？", "Aは生きている？"]
    text.forEach(tx => { form.button(tx) });
    form.button("戻る");
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == text.length) { this.QC(user) }
    if (selection < text.length) { this.QC_Q_2(user, text[selection]) }
    return
  }
  static async QC_Q_2(user, text) {
    let A = this.getPL()
    A.push({ nameTag: "みんな" })
    const form = new UI.ActionFormData().title(text);
    A.forEach(PL => { form.button(PL.nameTag) });
    form.button("戻る");
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == A.length) { this.QC_Q_1(user) }
    if (selection < A.length) { user.runCommandAsync(`tellraw @a {"rawtext":[{"text":"<${user.nameTag}> ${A[selection].nameTag + text}"}]}`) }
    return
  }
  static async QC_A(user) {
    const form = new UI.ActionFormData().title('回答');
    let text = ["はい", "いいえ", "わからない"]
    text.forEach(tx => { form.button(tx) });
    form.button("戻る");
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == text.length) { this.QC(user) }
    if (selection < text.length) { user.runCommandAsync(`tellraw @a {"rawtext":[{"text":"<${user.nameTag}> ${text[selection]}"}]}`) }
    return
  }
  static async QC_R(user) {
    const form = new UI.ActionFormData().title('要求');
    let text = ["来てください", "離れてください", "アイテムをください", "アイテムを見せてください", "クォーツをください", "ダイヤモンドを見せてください"]
    text.forEach(tx => { form.button(tx) });
    form.button("戻る");
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == text.length) { this.QC(user) }
    if (selection < text.length) { user.runCommandAsync(`tellraw @a {"rawtext":[{"text":"<${user.nameTag}> ${text[selection]}"}]}`) }
    return
  }
  static async QC_P(user) {
    const form = new UI.ActionFormData().title('プレイヤー');
    let PLs = this.getPL()
    PLs.forEach(PL => { form.button(PL.nameTag) });
    form.button("戻る");
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == PLs.length) { this.QC(user) }
    if (selection < PLs.length) { user.runCommandAsync(`tellraw @a {"rawtext":[{"text":"<${user.nameTag}> ${PLs[selection].nameTag}"}]}`) }
    return
  }
  static async WQ(user) {
    var text = ["はい", "いいえ", "攻撃", "走れ", "中に溶け込め", "ここに来て", "助けて"]
    const form = new UI.ActionFormData()
      .title('人狼チャット');
    text.forEach(tx => { form.button(tx) });

    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    user.runCommandAsync(`tellraw @a[scores={WolfC=1}] {"rawtext":[{"text":"§7[人狼チャット] ${text[selection]}"}]}`)
    user.runCommandAsync(`tellraw @a[m=!a] {"rawtext":[{"text":"§7[人狼チャット]<${user.nameTag}§7>\n${text[selection]}"}]}`)
    return
  }
  static async Help(user) {
    var text = ["役職について", "陣営について", "アイテムについて"]
    const form = new UI.ActionFormData()
      .title('ヘルプ');
    text.forEach(tx => { form.button(tx) });
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == 0) this.Help_R(user)
    if (selection == 1) this.Help_T(user)
    if (selection == 2) this.Help_I(user)
    return
  }

  static async Help_R(user) {
    let Role = config.Initial
    const form = new UI.ActionFormData()
      .title('役職について');
    Role.forEach(RL => { form.button(RL.name) });
    form.button("戻る")
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == Role.length) this.Help(user)
    if (selection < Role.length) this.Help_R_show(user, selection)
    return
  }
  static async Help_R_show(user, S) {
    let Role = config.Initial
    const form = new UI.ActionFormData()
      .title(`${Role[S].name}`)
      .body(`${Role[S].Commentary}`)
      .button("戻る");
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == 0) this.Help_R(user)
    return
  }

  static async Help_T(user) {
    const form = new UI.ActionFormData()
      .title('陣営について')
      .body("市民陣営\n人狼陣営の黒人外を全滅させると勝利\n\n人狼陣営\n市民陣営を全滅させると勝利\n\n狐陣営\n市民陣営、人狼陣営が勝利した時、生存していると横取り勝利\n\n恋人\n市民・人狼陣営が勝利した時生存していると横取り勝利\n(市民陣営のプレイヤーが恋人になった場合、市民陣営としてカウントされない)")
      .button("戻る")
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == 0) this.Help(user)
    return
  }

  static async Help_I(user) {
    let items = config.Items
    let text = ""
    items.forEach(I => { text = `${text + I.name}\n${I.Commentary}\n\n` });
    const form = new UI.ActionFormData()
      .title('アイテムについて')
      .body(text)
      .button("戻る");
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == 0) this.Help(user)
    return
  }

  static getPL() {
    let team = world.scoreboard.getObjective("a_live")
    let PLs = []
    let wPLs = world.getAllPlayers()
    for (let PL of team.getParticipants()) {
      if (Number(team.getScore(PL)) >= 0) PLs.push(wPLs.find(e => e.name === PL.displayName))
    }
    return PLs
  }
  static getRole() {
    let role = datas.slice()
    role.push({ name: "村人", score: 5 })
    return Array.from(new Set(role.map(R => R.name)));
  }
}