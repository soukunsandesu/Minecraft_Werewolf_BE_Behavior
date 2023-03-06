import { world } from "@minecraft/server";
world.getDimension("overworld").runCommandAsync("scoreboard objectives add tick dummy")
function CD(CD){world.getDimension("overworld").runCommandAsync(CD)}
world.events.tick.subscribe(ev => {
    let tick = ev.currentTick
    world.getDimension("overworld").runCommandAsync("function ST-main")
    // if (tick % 5 == 0) { }
})

world.events.effectAdd.subscribe(ev => {
   let entity = ev.entity
   let effct = ev.effect.displayName
    if (!entity.hasTag("PL")) {
        CD("say test")
        return
    }
    CD("say test2")

})