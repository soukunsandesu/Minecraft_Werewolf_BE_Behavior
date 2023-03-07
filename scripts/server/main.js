import { world } from "@minecraft/server";
import { items } from "./OnGame/items";
import * as UI from '@minecraft/server-ui';
import { FORM } from "./form/text";
//import { werewolf } from "./typescript"

function RunCommand(cmd) { world.getDimension("overworld").runCommandAsync(cmd) }
function Say(ms) { world.say(String(ms)) }
RightClick("stick")

world.events.effectAdd.subscribe(ev => {
    let entity = ev.entity
    let effect = ev.effect
    items.DamagePotion(effect, entity)
    items.SpeedPotion(effect, entity)
    // Say(effect.displayName + "\ntick:" + effect.amplifier + "\nlv:" + effect.duration)
})

function RightClick(arg) {
    world.events.itemUse.subscribe(ev => {
        const item = ev.item
        const user = ev.source
        //const gameMode = player.getGameMode()

        if (item.typeId == "minecraft:" + arg) {
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
})

world.events.tick.subscribe(ev => {
    let tick = ev.currentTick
    RunCommand("function werewolf/1tick")
    //werewolf.getPlayersFromScoreboard();
    if (tick % 20 == 0) {
// Say(tick)
    }
})