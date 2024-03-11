import { system, world } from "@minecraft/server";
import { items } from "./items";
import { F } from "./functions";
import { config } from "./data";
//import { werewolf } from "./typescript"

function RunCommand(cmd) { world.getDimension("overworld").runCommandAsync(cmd) }
function Say(ms) { RunCommand("say " + ms) }
function Log(ms) { RunCommand(`tell @a[tag=Debugger] §7[log] ${ms}`) }
function Nametag(name) { return name.replace(/(^§.\[(.*?)\]|§.$)/g, ""); }
// idを入力することでプレイヤーを取得する
function getPL(id) { return world.getAllPlayers().find(e => e.id === id); }

// 最初に実行させる
RunCommand("function werewolf/first_set")

let gameData = { time: 0, players: [{ player: world.getPlayers()[0], currentRole: config.Initial[0], previewRole: config.Initial[0], tags: [] }] }
gameData.players = []


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
    let itemObject = items.effects.filter(e => e.id === effect.displayName && e.amplifier === effect.amplifier)[0]
    if (itemObject) itemObject.use(effect, entity)
})

//死亡処理
world.afterEvents.entityDie.subscribe(ev => {
    if (ev.deadEntity.typeId === 'minecraft:player') {
        let team = world.scoreboard.getObjective("CurrentRole"),
            PLs = world.getAllPlayers(),
            target = PLs.find(e => e.nameTag === ev.deadEntity.nameTag),
            targetRroll,
            attacker = PLs.find(e => e.nameTag === ev.damageSource.nameTag),
            attackerRroll

        target.runCommandAsync('tag @s[scores={hunter=1..}] add Avo_dead')
        target.runCommandAsync('scoreboard players remove @s[scores={hunter=1..}] hunter')
        if (target.hasTag('Avo_dead')) {
            // 死を回避した場合
            target.runCommandAsync('function werewolf/ongame/dead_avo')
            target.removeTag('Avo_dead')
        } else {
            // 猫又の処理
            if (team == undefined) { return } else {
                for (let score of team.getScores()) {
                    if (score.participant.displayName === target.nameTag) { targetRroll = score }
                    if (score.participant.displayName === attacker.nameTag) { attackerRroll = score }
                }
                if (targetRroll?.score == 7) {
                    if (attacker && Math.floor(Math.random() * 2) == 0) {
                        ev.damageSource.damagingEntity.runCommandAsync(`function werewolf/ongame/nekomata`)
                    } else {
                        target.runCommandAsync(`execute as @r[scores={a_live=1}] at @s run function werewolf/ongame/nekomata`)
                    }
                } else if (attackerRroll?.score == 22) {
                    target.runCommandAsync('effect @s instant_health 1 3 true')
                }
            }
            // 死亡した場合
            target.runCommandAsync('function werewolf/ongame/dead_run')
        }
    }
})

// アイテム使用を検知
world.afterEvents.itemUse.subscribe(ev => {
    const item = ev.itemStack,
        user = ev.source
    let itemObject = items.items.filter(e => `minecraft:${e.id}` === item.typeId)[0]
    if (itemObject) itemObject.use(user, item)
    // Say(item.typeId)
})


// 攻撃が当たった事を検知
world.afterEvents.entityHitEntity.subscribe(ev => {
    const user = ev.damagingEntity,
        target = ev.hitEntity,
        item = user.getComponent('minecraft:inventory').container.getItem(user.selectedSlot)
    if (target == null) return
    let itemObject = items.attack.filter(e => `minecraft:${e.id}` === item?.typeId || (`minecraft:${e.attack}` === target.typeId && e.nametag === target.nameTag))[0]
    if (itemObject) itemObject.use(user, item, target)
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

function gameCheck() {
    let teamCount = { team1: 0, team2: 0, team3: 0, team4: 0, team5: 0, member: 0, lover: 0 }, winTeam = -1
    for (let i = 0; i < gameData.players.length; i++) {
        if (0 < gameData.players[i].tags.life) {
            teamCount[`team${gameData.players[i].currentRole.team}`]++
            teamCount.member++
        }
        if (gameData.players[i].tags.includes('lover')) {
            teamCount.lover++
        }
    }
    if (teamCount.team1 == 0 && teamCount.team3 == 0) winTeam = 0
    if (teamCount.team1 != 0 && teamCount.team3 == 0 && teamCount.team5 == 0) winTeam = 1
    if (teamCount.team3 != 0 && teamCount.team1 == 0 && teamCount.team5 == 0) winTeam = 3
    if (teamCount.team4 != 0 && winTeam != -1) winTeam = 4
    if (teamCount.team5 != 0 && winTeam == 0) winTeam = 5
    if (teamCount.lover != 0 && winTeam != -1) winTeam = 'lover'

    if (winTeam != -1) {
        let texts = ['引き分け', '§c人狼の勝利', 'null', '§a村人の勝利', '§e狐の勝利', '§7ボマーの勝利', '§d恋人の勝利'], winners = ''
        for (let i = 0; i < gameData.players.length; i++) {
            if (gameData.players[i].currentRole.team == winTeam || gameData.players[i].tags.includes(winTeam)) {
                if (winners != '') winners += ','
                winners += gameData.players[i].player.nameTag
            }
        }
        F.RunCommand(`title @a title ${texts[winTeam]}`)
        F.RunCommand(`tellraw @a {"rawtext":[{"text":"${texts[winTeam]}\n§r${winners}"}]}`)
        F.RunCommand(`function werewolf/onfinish/clean_up`)
    }
}