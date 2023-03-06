import { world } from "@minecraft/server";

function RunCommand(cmd) { world.getDimension("overworld").runCommandAsync(cmd) }

RunCommand("scoreboard objectives add tick dummy")
world.events.tick.subscribe(ev => {
    let tick = ev.currentTick
    RunCommand("function ST-main")
    // if (tick % 5 == 0) { }
})

world.events.effectAdd.subscribe(ev => {
    let entity = ev.entity
    let effct = ev.effect
    if (entity.hasTag("PL")) {
        if (effct.displayName.match(/弱体化/)) {
            entity.runCommandAsync("kill @s")
        }
        return
    }
})