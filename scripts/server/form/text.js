import { world } from "@minecraft/server";
import * as UI from '@minecraft/server-ui';
import { config } from '../data.js';

let datas = config.Rolls

export class FORM {
  static async gameinfo(user) {
    let PLs = world.getAllPlayers()
    let PLc = PLs.filter(n => n.hasTag("player"));
    const form = new UI.ActionFormData()
      .title('指令は？')
      .button('ゲーム開始')
      .button(`プレイヤー ${PLc.length}/${PLs.length}`)
      .button('ゲーム中断')
      .button(`役職編成\n${datas.length}枠設定済み`);
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    // userのrollを取得

    if (selection === 0) this.gamestart(user);
    if (selection === 1) return await this.GetPlayers(user);
    if (selection === 2) user.runCommandAsync("function werewolf/onfinish/reset");
    if (selection === 3) return await this.rollinfo(user);
  }


  static async gamestart(user) {
    if (datas.length > 2) {
      let PLs = world.getPlayers()
      user.runCommandAsync("function werewolf/start_First")
      for (let data of datas) {
        user.runCommandAsync("execute as @r[tag=player,scores={CurrentRole=0}] run scoreboard players set @s CurrentRole " + data.score)
      }
      user.runCommandAsync("function werewolf/start_Latter")
    } else {
      world.say("ロールが少なすぎます！\n" + datas.length + ">2")
    }
  }

  static async GetPlayers(user) {
    let PLs = world.getAllPlayers()
    let PLc = PLs.filter(n => n.hasTag("player"));
    const form = new UI.ActionFormData()
      .title(`参加状態の変更 ${PLc.length}/${PLs.length}人`);
    let i = 0
    for (let PL of PLs) {
      let status = "c待機中"
      i = i + 1
      if (PL.hasTag("player")) status = "a参加中"
      form.button(`${i}:${PL.name}\n§${status}`)
    }
    form.button('戻る');
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection == i) return await this.gameinfo(user)
    if (PLs[selection].hasTag("player")) {
      PLs[selection].removeTag("player")
    } else { PLs[selection].addTag("player") }
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
    let i = 0
    for (let Initial of Initials) {
      form.button(Initial.name)
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
      user.runCommandAsync(`effect @a[name=!${PL.name},m=a] blindness 10 0 false`)
      user.runCommandAsync("title @a times 5 20 10")
      user.runCommandAsync("title @a title 停 電 発 生")
      user.runCommandAsync("title @a subtitle 10秒後に復旧します")
      user.runCommandAsync("playsound mob.wither.spawn @a ~ ~ ~ 100 1 100");
    }
    if (selection === 1) {
      user.runCommandAsync("scoreboard players reset @a give_item")
      user.runCommandAsync("scoreboard players random @s give_item 1 10")
      user.runCommandAsync("function werewolf/onstart/give_items")
    }
    if (selection === 2) {
      user.runCommandAsync("effect @s invisibility 10 0")
      user.runCommandAsync(`tp @s @a[c=-1,name=!"${PL.name}",scores={a_live=1..}]`)
      user.runCommandAsync("playsound portal.travel @a ~~~ 30 1 100")
    }
    if (selection === 3) {
      user.runCommandAsync("effect @s invisibility 10 0")
      user.runCommandAsync(`tp @s @a[c=-1,name=!"${PL.name}",scores={CurrentRole=1}]`)
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
      form.button(PL.displayName)
    });
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    let reply = team.getScore(PLs[selection])
    let textTeam = ["観戦", "黒", "白"]
    let answer

    // userのrollを取得
    let PL = world.getAllPlayers().find(e => e.id === user.id);
    let userroll
    for (let score of team.getScores()) {
      if (score.participant.displayName === PL.name) { userroll = score.score }
    }

    // rollが見かけ上は予言だが、本当は違った場合用
    // 例：偽占い 怪盗に進まれた占い
    if (userroll != 3) {
      user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"${PLs[selection].displayName}は白です"}]}`)
      user.runCommandAsync("clear @s diamond 0 1")
      return
    }
    if (reply > 1) { answer = textTeam[2] } else { answer = textTeam[reply] }
    if (reply == 8) { answer = "狐" }
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
    let live_PL = a_live.getParticipants()
    let live
    for (let PL of live_PL) {
      let score = a_live.getScore(PL)
      if (PL.displayName == PLs[selection].displayName) { live = score }
    }

    let reply = team.getScore(PLs[selection])
    let textTeam = ["は観戦です", "は黒です", "は白です"]
    let answer

    // userのrollを取得
    let PL = world.getAllPlayers().find(e => e.id === user.id);
    let userroll
    for (let score of team.getScores()) {
      if (score.participant.displayName === PL.name) { userroll = score.score }
    }

    // rollが見かけ上は霊媒だが、本当は違った場合用
    // 例：怪盗に進まれた霊媒
    if (userroll != 4) {
      if (live == 0) {
        answer = "は白"
      } else { answer = "の魂は見つかりませんでした…" }
      user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"${PLs[selection].displayName}${answer}"}]}`)
      user.runCommandAsync("clear @s diamond 0 1")
      return
    }
    if (live == 0) {
      if (reply > 1) { answer = textTeam[2] } else { answer = textTeam[reply] }
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
    let textTeam = ["観戦", "人狼", "狂人", "預言者", "霊媒師", "村人", "怪盗"]
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
      if (reply == 1) { answer = '貴方の役職は人狼です 人狼は"},{"selector":"@e[scores={CurrentRole=1}]"},{"text":"' } else { answer = textTeam[reply] }
      user.runCommandAsync(`scoreboard players operation @s CurrentRole = "${PLs[selection].displayName}" CurrentRole`)
      user.runCommandAsync(`scoreboard players operation @s PreviewRole = @s CurrentRole`)
      user.runCommandAsync(`execute as @a[name="${PLs[selection].displayName}",hasitem={item=diamond}] run give "${PL.name}" diamond 1 0 {"item_lock":{"mode":"lock_in_inventory"}}`)
      user.runCommandAsync(`scoreboard players set "${PLs[selection].displayName}" CurrentRole 5`)
      user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"貴方の役職は${answer}です"}]}`)
      user.runCommandAsync("clear @s diamond 0 1")
    } else {
      user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"死者からは盗めません"}]}`)
    }
  }

  static test() {
  }
}