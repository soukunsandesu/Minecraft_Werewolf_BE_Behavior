import { Player, Scoreboard, world } from "@minecraft/server";
import { items } from "./OnGame/items";
import * as UI from '@minecraft/server-ui';
import { FORM } from "./form/text";
//import { werewolf } from "./typescript"

function RunCommand(cmd) { world.getDimension("overworld").runCommandAsync(cmd) }
function Say(ms) { world.say(String(ms)) }
function Nametag(user) {
    var name = user.name
    user.Nametag = name.replace(/(^§.\[(.*?)\]|§.$)/g, "");
}

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

    if (item.typeId == "minecraft:stick") {
        //user.runCommandAsync("gamemode " + gameMode == GameMode.creative ? "adventure" : "creative")
    }
    // 占い石
    if (item.typeId == "minecraft:gold_ingot") {
        FORM.PLform(user)
    }

    items.blackout(user, item)

    if (item.typeId == "minecraft:diamond") {
        FORM.divination(user)
        return
    }
    // items.divination(user, item)
})

world.events.entityHit.subscribe(ev => {
    let user = ev.entity
    let target = ev.hitEntity
    items.PoisonInjection(user, target)
})



// test
world.events.beforeChat.subscribe(ev => {
    let user = ev.sender
    Nametag(user)
    if (user.hasTag("spectator")) {
        ev.cancel = true
        RunCommand(`tellraw @a[m=!a] {"rawtext":[{"text":"§7[スペクテイターチャット]<${user.name}> ${ev.message}"}]}`)
    }
})
// world.events.playerJoin.subscribe(ev => {
//     Nametag(ev.player)
// })
world.events.tick.subscribe(ev => {
    let tick = ev.currentTick
    RunCommand("function werewolf/1tick")
    //werewolf.getPlayersFromScoreboard();
    if (tick % 20 == 0) {
        // Say(tick)
    }
})