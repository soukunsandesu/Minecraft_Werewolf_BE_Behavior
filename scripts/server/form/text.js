import { world } from "@minecraft/server";
import * as UI from '@minecraft/server-ui';


world.events.beforeChat.subscribe(ev => {
  const user = ev.sender
})
export class FORM {
  static async PLform(user) {
    const form = new UI.ActionFormData()
      .title('妨害せよ')
      .button('停電')
      .button('転移');
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    if (selection === 0) {
      user.runCommandAsync('effect @a blindness 15 0 true')
    }
    if (selection === 1) { user.runCommandAsync('tp @s @r[rm=1]') }
  }

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
    if (reply > 1) { answer = textTeam[2] } else { answer = textTeam[reply] }
    user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"${PLs[selection].displayName}は${answer}です"}]}`)
    user.runCommandAsync("clear @s diamond 0 1")
  }
  static async psychic(user) {
    let team = world.scoreboard.getObjective("CurrentRole")
    let PLs = team.getParticipants()
    let anPLs = []
    for (let PL of PLs) {
      let score = team.getScore(PL)
      if (Number(score) > 0) {anPLs.push(PL)
      }
    }
    const form = new UI.ActionFormData()
      .title('誰を霊界から呼ぶ？');
    anPLs.forEach(PL => {
      form.button(PL.displayName)
    });
    const { selection, canceled } = await form.show(user);
    if (canceled) return;
    let a_lives = world.scoreboard.getObjective("a_live")
    let a_live = a_lives.getScore(PLs[selection])
    let reply = team.getScore(PLs[selection])
    let textTeam = ["は観戦です", "は黒です", "は白です"]
    let answer
    if(a_live>0){
      if (reply > 1) { answer = textTeam[2] } else { answer = textTeam[reply] }
    } else { answer ="の魂は見つかりませんでした…"}
    user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"${PLs[selection].displayName}${answer}"}]}`)
    user.runCommandAsync("clear @s diamond 0 1")
  }


  static test() {
  }
}