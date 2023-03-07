import { world } from "@minecraft/server";

export class items {
    static GiveItem(player) {
        player.addItem("minecraft:diamond", 1); //addItemなんてなかった←m9(^Д^)ﾌﾟｷﾞｬｰ
    }

    static DamagePotion(effect, entity) {
        if (effect.displayName.match(/弱体化/) && effect.amplifier == 0) {
            entity.runCommandAsync("effect @s clear");
            entity.runCommandAsync("damage @s 20 anvil entity @s");
            return
        }
    }
    static SpeedPotion(effect, entity) {
        if (effect.displayName.match(/スピード/) && effect.duration == 3600 && effect.amplifier == 0) {
            entity.runCommandAsync("effect @s speed 180 8");
            return
        }
    }
    static blackout(user, item) {
        if (item.typeId == "minecraft:double_plant") {
            user.runCommandAsync(`effect @a[name=!${user.nameTag},m=a] blindness 10 0 false`)
            user.runCommandAsync("clear @s double_plant 0 1")
            user.runCommandAsync("title @a times 5 20 10")
            user.runCommandAsync("title @a title 停 電 発 生")
            user.runCommandAsync("title @a subtitle 10秒後に復旧します")
            user.runCommandAsync("playsound mob.wither.spawn @a ~ ~ ~ 100 1 100");
            return
        }
    }
    static divination(user, item) {
        if (item.typeId == "minecraft:diamond") {
            return
        }
    }
    static PoisonInjection(user, target) {
        if (user.hasTag("PoisonInjection")) {
            user.runCommandAsync("clear @s wither_rose 0 1")
            target.runCommandAsync("scoreboard players set @s poison 1800")
            return
        }
    }
}