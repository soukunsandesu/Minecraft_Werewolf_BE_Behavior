import { world } from "@minecraft/server";
import { items } from "./OnGame/items";
import * as UI from '@minecraft/server-ui';
import { FORM } from "./form/text";
//import { werewolf } from "./typescript"

function RunCommand(cmd) { world.getDimension("overworld").runCommandAsync(cmd) }
function Say(ms) { world.say(String(ms)) }
world.events.effectAdd.subscribe(ev => {
    let entity = ev.entity
    let effect = ev.effect
    items.DamagePotion(effect, entity)
    items.SpeedPotion(effect, entity)
    // Say(effect.displayName + "\nlv:" + effect.amplifier + "\ntick:" + effect.duration)
})

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
    items.blackout(user, item)
})

// test
world.events.beforeChat.subscribe(ev => {
    let user = ev.sender
    // user.nameTag()=user.name
})

world.events.tick.subscribe(ev => {
    let tick = ev.currentTick
    RunCommand("function werewolf/1tick")
    //werewolf.getPlayersFromScoreboard();
    if (tick % 20 == 0) {
        // Say(tick)
    }
})