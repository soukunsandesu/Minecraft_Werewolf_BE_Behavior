import { world } from "@minecraft/server";
import * as UI from '@minecraft/server-ui';
import { FORM } from "../form/text";
function Say(ms) { world.say(String(ms)) }

export class items {
    static GiveItem(player) {
        player.addItem("minecraft:diamond", 1); //addItemなんてなかった←m9(^Д^)ﾌﾟｷﾞｬｰ
    }

    static DamagePotion(effect, entity) {
        if (effect.displayName.match(/ウィザー/) && effect.amplifier == 1) {
            entity.runCommandAsync("effect @s clear");
            entity.runCommandAsync("damage @s 20 anvil entity @s");
            return
        }
    }
    static InvisibilityPotion(effect, entity) {
        if (effect.displayName.match(/不可視/) && effect.duration == 3600 && effect.amplifier == 0) {
            entity.runCommandAsync("effect @s invisibility 60 1");
            return
        }
    }
    static SpeedPotion(effect, entity) {
        if (effect.displayName.match(/スピード/) && effect.duration == 3600 && effect.amplifier == 0) {
            entity.runCommandAsync("effect @s speed 60 8");
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
            let team = world.scoreboard.getObjective("PreviewRole")
            let PL = world.getAllPlayers().find(e => e.id === user.id);
            let userroll
            for (let score of team.getScores()) {
                if (score.participant.displayName === PL.name) { userroll = score }
            }
            if (userroll== null)return

            // 見かけ上のrollの役職の効果を発動する(PreviewRole)
            // 真偽の判定、それに伴う処理の分岐はFORM内で記述
            if (userroll.score === 1) {
                FORM.werewolf(user)
            }
            if (userroll.score === 3) {
                FORM.divination(user)
            }
            if (userroll.score === 4) {
                FORM.psychic(user)
            }
            if (userroll.score === 6) {
                FORM.thief(user)
            }
            return
        }
    }
    static player_eye(user, item) {
        if (item.typeId == "minecraft:ender_eye") {
            user.runCommandAsync("clear @s ender_eye 0 1")
            user.runCommandAsync("effect @s blindness 1 0 true")
            user.runCommandAsync("tp @s ~~~ facing @a[c=-1,rm=1,m=a,scores={CurrentRole=1..}]")
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
    static ruin(user, target) {
        if (user.hasTag("ruin")) {
            user.runCommandAsync("summon lightning_bolt ~~~")
            user.runCommandAsync("damage @s 10 anvil")
            target.runCommandAsync("damage @s 30 anvil")
            return
        }
    }
}