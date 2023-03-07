import { world } from "@minecraft/server";

export class items {
    static GiveItem(player) {
        player.addItem("minecraft:diamond", 1); //addItemなんてなかった←m9(^Д^)ﾌﾟｷﾞｬｰ
    }

    static DamagePotion(effect, entity) {
        if (effect.displayName.match(/弱体化/)) {
            entity.runCommandAsync("effect @s instant_damage 1 10 true");
            entity.runCommandAsync("effect @s clear");
        }
    }
    static SpeedPotion(effect, entity) {
        if (effect.displayName.match(/スピード/) && effect.duration == 3600 && effect.amplifier == 0) {
            entity.runCommandAsync("effect @s speed 60 8");
        }
    }
}