import { system, world } from "@minecraft/server";
import { items } from "./items";
import { F } from "./functions";
//import { werewolf } from "./typescript"

function RunCommand(cmd) { world.getDimension("overworld").runCommandAsync(cmd) }
function Say(ms) { RunCommand("say " + ms) }
function Log(ms) { RunCommand(`tell @a[tag=Debugger] §7[log] ${ms}`) }
function Nametag(name) { return name.replace(/(^§.\[(.*?)\]|§.$)/g, ""); }
// idを入力することでプレイヤーを取得する
function getPL(id) { return world.getAllPlayers().find(e => e.id === id); }

// 最初に実行させる
RunCommand("function werewolf/first_set")

// killするアイテム
const itemIds = ["minecraft:diamond", "minecraft:barrier", "minecraft:stick", "minecraft:leather_chestplate", "minecraft:leather_leggings", "minecraft:leather_boots"]
// entityのスポーンを検知 アイテムのドロップもこれに含む
world.afterEvents.entitySpawn.subscribe(ev => {
    if (ev?.entity?.typeId != 'minecraft:item') return
    if (itemIds.includes(ev.entity.getComponent('minecraft:item')?.itemStack?.typeId)) ev.entity.kill()
    if (ev.entity.getComponent('minecraft:item')?.itemStack?.typeId == "minecraft:respawn_anchor") ev.entity.addTag("C4bomb")
})

// エフェクト付与を検知
world.afterEvents.effectAdd.subscribe(ev => {
    let entity = ev.entity
    let effect = ev.effect
    // Log(entity.typeId+"\n"+effect.displayName + "\nlv:" + effect.amplifier + "\ntick:" + effect.duration)
    items.DamagePotion(effect, entity)
    items.InvisibilityPotion(effect, entity)
    items.SpeedPotion(effect, entity)
})

<<<<<<< HEAD

=======
>>>>>>> 27f0b7952cf0c2533dad3ecfa69edfa6145d74c4
//死亡処理
world.afterEvents.entityDie.subscribe(ev => {
    if (ev.deadEntity.typeId === 'minecraft:player') {
        let team = world.scoreboard.getObjective("CurrentRole"),
            PL = world.getAllPlayers().find(e => e.nameTag === ev.deadEntity.nameTag),
            userroll
        PL.runCommandAsync('tag @s[scores={hunter=1..}] add Avo_dead')
        PL.runCommandAsync('scoreboard players remove @s[scores={hunter=1..}] hunter')
        if (PL.hasTag('Avo_dead')) {
            // 死を回避した場合
            PL.runCommandAsync('function werewolf/ongame/dead_avo')
            PL.removeTag('Avo_dead')
        } else {
            // 猫又の処理
            if (team == undefined) { return } else {
                for (let score of team.getScores()) {
                    if (score.participant.displayName === PL.nameTag) { userroll = score }
                }
                if (userroll == undefined) return
                if (userroll.score == 7) {
<<<<<<< HEAD
                    if (ev.damageSource?.damagingEntity?.typeId == 'minecraft:player' && Math.floor(Math.random() * 2) == 0) {
=======
                    if (ev.damageSource.damagingEntity && Math.floor(Math.random() * 2) == 0) {
>>>>>>> 27f0b7952cf0c2533dad3ecfa69edfa6145d74c4
                        ev.damageSource.damagingEntity.runCommandAsync(`function werewolf/ongame/nekomata`)
                    } else {
                        ev.deadEntity.runCommandAsync(`execute as @r[scores={a_live=1}] at @s run function werewolf/ongame/nekomata`)
                    }
                }
            }
            // 死亡した場合
            PL.runCommandAsync('function werewolf/ongame/dead_run')
        }
        // 死亡した場合
        PL.runCommandAsync('function werewolf/ongame/dead_run')
    }
})

// アイテム使用を検知
world.afterEvents.itemUse.subscribe(ev => {
    const item = ev.itemStack,
        user = ev.source

    items.jukebox(user, item)
    items.blackout(user, item)
    items.player_eye(user, item)
    items.divination(user, item)
    items.aspirator(user, item)
    items.wooden_button(user, item)
    items.feather(user, item)
    items.GameFoam(user, item)
    items.Qchat(user, item)
    items.portal_set(user, item)
    items.shout(user, item)
    // Say(item.typeId)
})


// 攻撃が当たった事を検知
world.afterEvents.entityHitEntity.subscribe(ev => {
    const user = ev.damagingEntity,
        target = ev.hitEntity
    if (target == null) return
    items.PoisonInjection(user, target)
    items.ruin(user, target)
    items.C4bomb(user, target)
    items.portal_use(user, target)
})



// チャットを検知
world.beforeEvents.chatSend.subscribe(ev => {
    let user = ev.sender
    let ms = ev.message
    if (!user.nameTag) { user.nameTag = Nametag(user.name) }
    ev.cancel = true
    if (ms.match(/"/)) {
        user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"§7ダブルクォート(\")は入力できません"}]}`)
        return
    }
    if (ms.match(/^.name/)) {
        var name = ms.replace(".name", "");
        nameTag(user, name)
        return
    }

    if (user.hasTag("spectator")) {
        RunCommand(`tellraw @a[m=!a] {"rawtext":[{"text":"§7[スペクテイターチャット]<${user.nameTag}> ${ms}"}]}`)
    } else {
        RunCommand(`tellraw @a {"rawtext":[{"text":"<${user.nameTag}> ${ms}"}]}`)
    }
})

// ティックごとに実行
system.runInterval(ev => {
    RunCommand("function werewolf/1tick")
}, 1)
system.runInterval(ev => {
    RunCommand("function werewolf/20tick")
    // if (newPLs.length > 0) {
    // }
}, 20)

function nameTag(user, name) {
    name = name.replace(/(^§.\[(.*?)\]|\\|§.$)/g, "");
    if (name.length > 0) {
        user.nameTag = name
        user.runCommandAsync(`tellraw @a {"rawtext":[{"text":"<system> ${user.name}§rの名前を${user.nameTag}§rに設定しました\n同じ名前のプレイヤーが存在するとバグります注意してください"}]}`)
    } else {
        user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"§7名前が入力されていません"}]}`)
    }

}
