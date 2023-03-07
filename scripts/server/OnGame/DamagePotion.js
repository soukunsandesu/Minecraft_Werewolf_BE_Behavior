import { world } from "@minecraft/server";

export class DamagePotion {
    static GiveItem(player) {
        player.addItem("minecraft:diamond", 1); //addItemなんてなかった←m9(^Д^)ﾌﾟｷﾞｬｰ
    }

    static Core() {
        world.events.effectAdd.subscribe(ev => {
            let entity = ev.entity
            let effct = ev.effect
            if (effct.displayName.match(/弱体化/)) {
                entity.runCommandAsync("effect @s instant_damage 1 10 true");
                entity.runCommandAsync("effect @s clear");
            }
        })
    }
}