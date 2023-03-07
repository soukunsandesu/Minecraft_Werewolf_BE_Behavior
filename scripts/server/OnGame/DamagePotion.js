import { world } from "@minecraft/server";

export class DamagePotion {
    static GiveItem(player) {
        player.addItem("minecraft:diamond", 1); //addItemなんてなかった←m9(^Д^)ﾌﾟｷﾞｬｰ
    }

    static Core(ev) {
        let entity = ev.entity
        let effect = ev.effect
            if (effect.displayName.match(/弱体化/)) {
                entity.runCommandAsync("effect @s instant_damage 1 10 true");
                entity.runCommandAsync("effect @s clear");
            }
            
        }
    }