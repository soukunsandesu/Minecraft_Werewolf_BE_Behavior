import { world } from "@minecraft/server";
import { DamagePotion } from "./OnGame/DamagePotion";

function RunCommand(cmd) { world.getDimension("overworld").runCommandAsync(cmd) }

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
    })
}