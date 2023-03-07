import { world } from "@minecraft/server";
import { DamagePotion } from "./OnGame/DamagePotion";
import * as UI from '@minecraft/server-ui';
import { FORM } from "./form/text";


function RunCommand(cmd) { world.getDimension("overworld").runCommandAsync(cmd) }
function Say(ms) { world.say(String(ms)) }
RightClick("stick")

function RightClick(arg) {
    world.events.itemUse.subscribe(ev => {
        const item = ev.item
        const user = ev.source
        //const gameMode = player.getGameMode()

        if (item.typeId == "minecraft:" + arg) {
            DamagePotion.GiveItem(user)
            //user.runCommandAsync("gamemode " + gameMode == GameMode.creative ? "adventure" : "creative")
        }
        // test
        if (item.typeId == "minecraft:iron_ingot") {
            FORM.PLform(user)
        }
    })
}

// test
world.events.beforeChat.subscribe(ev => {
    let user = ev.sender
    let ms = ev.message
    if (ms == "test") {
        // FORM.PLform(user)
        const form = new UI.ActionFormData()
            .title('妨害せよ')
            .button('停電')
            .button('転移');
        const { selection, canceled } = form.show(user);
        if (canceled) return;
        if (selection === 0) { user.runCommandAsync('/effect @a[rm=1] blindness 15 0 true') }
        if (selection === 1) { user.runCommandAsync('tp @s @r[rm=1]') }

    }
})

world.events.tick.subscribe(ev => {
    let tick = ev.currentTick
    RunCommand("function zn/1tick")
    if (tick % 20 == 0) {
// Say(tick)
    }
})