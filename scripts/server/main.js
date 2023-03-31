import { system, world } from "@minecraft/server";
import { items } from "./OnGame/items";
import * as UI from '@minecraft/server-ui';
import { FORM } from "./form/text";
//import { werewolf } from "./typescript"

function RunCommand(cmd) { world.getDimension("overworld").runCommandAsync(cmd) }
function Say(ms) { RunCommand("say " + ms) }
function Log(ms) { RunCommand(`tell @a[tag=Debugger] §7[log] ${ms}`) }
function Nametag(name) { return name.replace(/(^§.\[(.*?)\]|§.$)/g, ""); }
// idを入力することでプレイヤーを取得する
function getPL(id) { return world.getAllPlayers().find(e => e.id === id); }


// プレイヤーの参加を検知
world.events.playerJoin.subscribe(ev => {
    let PL = world.getAllPlayers().find(e => e.name === ev.playerName);
    Say(ev.playerName + "\n" + ev.playerId+"\n"+PL+"\n"+PL.id)
    PL.nameTag = Nametag(PL.name)
    PL.addTag("joinPL")
    
})


// 死んだことを検知
world.events.entityDie.subscribe(ev => {
    // playerか否か
    if (ev.deadEntity.typeId != "minecraft:player") return
    let PL = getPL(ev.deadEntity.id)
})

// killするアイテム
const itemIds = ["minecraft:diamond", "minecraft:barrier"]
// entityのスポーンを検知 アイテムのドロップもこれに含む
world.events.entitySpawn.subscribe(ev => {
    if (ev.entity.typeId != 'minecraft:item') return
    if (itemIds.includes(ev.entity.getComponent('minecraft:item')?.itemStack?.typeId)) ev.entity.kill()
})

// エフェクト付与を検知
world.events.effectAdd.subscribe(ev => {
    let entity = ev.entity
    let effect = ev.effect
    // Log(entity.typeId+"\n"+effect.displayName + "\nlv:" + effect.amplifier + "\ntick:" + effect.duration)
    items.DamagePotion(effect, entity)
    items.InvisibilityPotion(effect, entity)
    items.SpeedPotion(effect, entity)
})

// アイテム使用を検知
world.events.itemUse.subscribe(ev => {
    const item = ev.item
    const user = ev.source

    items.jukebox(user, item)
    items.blackout(user, item)
    items.player_eye(user, item)
    items.divination(user, item)
    items.GameFoam(user, item)
    items.aspirator(user, item)
})

// 攻撃が当たった事を検知
world.events.entityHit.subscribe(ev => {
    let user = ev.entity
    let target = ev.hitEntity
    if (target == null) { return }
    items.PoisonInjection(user, target)
    items.ruin(user, target)
})



// チャットを検知
world.events.beforeChat.subscribe(ev => {
    let user = ev.sender
    let ms = ev.message
    ev.cancel = true
    if (ms.match(/"/)) {
        user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"§7ダブルクォート(\")は入力できません"}]}`)
        return
    }
    if (ms.match(/^.name/)) {
        var name = ms.replace(".name", "");
        name = name.replace(/(^§.\[(.*?)\]|§.$)/g, "");
        if (name.length > 0) {
            user.nameTag = name
            user.runCommandAsync(`tellraw @a {"rawtext":[{"text":"<system> ${user.name}§rの名前を${user.nameTag}§rに設定しました"}]}`)
            Say(user.nameTag)
        } else {
            user.runCommandAsync(`tellraw @s {"rawtext":[{"text":"§7名前が入力されていません"}]}`)
        }
        return
    }

    if (user.hasTag("spectator")) {
        RunCommand(`tellraw @a[m=!a] {"rawtext":[{"text":"§7[スペクテイターチャット]<${user.nameTag}> ${ms}"}]}`)
    } else {
        RunCommand(`tellraw @a[m=!a] {"rawtext":[{"text":"<${user.nameTag}> ${ms}"}]}`)
    }
})

// ティックごとに実行
system.runInterval(ev => {
    RunCommand("function werewolf/1tick")
}, 1)
system.runInterval(ev => {
    RunCommand("function werewolf/20tick")
}, 20)

