import { world } from "@minecraft/server";
import * as UI from '@minecraft/server-ui';


world.events.beforeChat.subscribe(ev => {
  const user = ev.sender
})
export class FORM {
  static async PLform(ev) {
    let user = ev
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

  static test() {
  }
}