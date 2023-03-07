import { world } from "@minecraft/server";

export class items {
    static GiveItem(player) {
        player.addItem("minecraft:diamond", 1); //addItemなんてなかった←m9(^Д^)ﾌﾟｷﾞｬｰ
    }

    static DamagePotion(effect, entity) {
        if (effect.displayName.match(/弱体化/) && effect.amplifier == 0) {
            entity.runCommandAsync("effect @s clear");
            entity.runCommandAsync("damage @s 20 anvil entity @s");
        }
    }
    static SpeedPotion(effect, entity) {
        if (effect.displayName.match(/スピード/) && effect.duration == 3600 && effect.amplifier == 0) {
            entity.runCommandAsync("effect @s speed 60 8");
        }
    }
    static blackout(user,item) {
        if (item.typeId == "minecraft:double_plant") {
            user.runCommandAsync(`effect @a[name=!${user.name},m=a] blindness 10 0 true`)
            user.runCommandAsync("clear @s double_plant 0 1")
            user.runCommandAsync("title @a times 5 20 10")
            user.runCommandAsync("title @a title 停電が起こった！")
            user.runCommandAsync("title @a subtitle 10秒後に復旧します")
        }
    }
}