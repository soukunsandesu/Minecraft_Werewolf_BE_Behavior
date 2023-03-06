import { world } from "@minecraft/server";
world.getDimension("overworld").runCommandAsync("scoreboard objectives add tick dummy")
world.events.tick.subscribe(ev => {
    let tick = ev.currentTick
    world.getDimension("overworld").runCommandAsync("function ST-main")
    // if (tick % 5 == 0) { }
})