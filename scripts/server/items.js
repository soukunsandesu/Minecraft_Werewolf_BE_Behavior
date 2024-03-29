import { world } from "@minecraft/server";
import { FORM } from "./form";
import { F } from "./functions";
function Say(ms) { world.say(String(ms)) }

export const items = {
    effects: [
        {
            id: '攻撃力上昇', amplifier: 0,
            name: 0, type: 'effect',
            use: function (effect, entity) {
                // if ((effect.displayName.match(/力/) && effect.amplifier == 0) || (effect.displayName.match(/ウィザー/) && effect.amplifier == 1)) {
                entity.runCommandAsync("effect @s clear");
                entity.runCommandAsync("damage @s 20 anvil entity @s");
                return
                // }
            }
        }, {
            id: '透明化', amplifier: 0,
            name: 0, type: 'effect',
            use: function (effect, entity) {
                // if (effect.displayName.match(/透明化/) && effect.amplifier == 0) {
                entity.runCommandAsync("effect @s invisibility 60 5");
                return
                // }
            }
        }, {
            id: '移動速度上昇', amplifier: 0,
            name: 0, type: 'effect',
            use: function (effect, entity) {
                // if (effect.displayName.match(/移動速度上昇/) && effect.amplifier == 0) {
                entity.runCommandAsync("effect @s speed 60 8");
                return
                // }
            }
        }
    ],
    items: [
        {
            id: 'double_plant',
            name: 0, type: 'use',
            use: function (user, item) {
                user.runCommandAsync(`effect @a[name=!"${user.nameTag}",m=a] blindness 10 0 false`)
                user.runCommandAsync("clear @s double_plant 0 1")
                user.runCommandAsync("title @a times 5 20 10")
                user.runCommandAsync("title @a title 停 電 発 生")
                user.runCommandAsync("title @a subtitle 10秒後に復旧します")
                user.runCommandAsync("playsound mob.wither.spawn @a ~ ~ ~ 100 1 100")
                return
            }
        }, {
            id: 'hopper',
            name: 0, type: 'use',
            use: function
                (user, item) {
                user.runCommandAsync(`tp @e[type=item,name=!"§r§f地雷",name=!"§r§fC4爆弾"] @s`)
                user.runCommandAsync("clear @s hopper 0 1")
                return
            }
        },
        {
            id: 'diamond',
            name: 0, type: 'use',
            use: function (user, item) {
                let team = world.scoreboard.getObjective("PreviewRole")
                let PL = world.getAllPlayers().find(e => e.id === user.id);
                let userroll
                if (team == undefined) { return } else {
                    for (let score of team.getScores()) {
                        if (score.participant.displayName === PL.name) { userroll = score }
                    }
                    if (userroll == null) return

                    // 見かけ上のrollの役職の効果を発動する(PreviewRole)
                    // 真偽の判定、それに伴う処理の分岐はFORM内で記述
                    let score = userroll.score
                    if (score == 1 || score == 10 || score == 11) {
                        FORM.werewolf(user)
                    }
                    else if (score == 3) {
                        FORM.divination(user)
                    }
                    else if (score == 4) {
                        FORM.psychic(user)
                    }
                    else if (score == 6) {
                        FORM.thief(user)
                    }
                    else if (score == 17) {
                        FORM.hunter(user)
                    }
                    else if (score == 21) {
                        FORM.counselor(user)
                    }
                    return
                }
            }
        }, {
            id: 'ender_eye',
            name: 0, type: 'use',
            use: function (user, item) {
                user.runCommandAsync("clear @s ender_eye 0 1")
                user.runCommandAsync("effect @s blindness 1 0 true")
                user.runCommandAsync("tp @s[tag=!sneaking] ~~~ facing @a[c=-1,rm=1,m=a,scores={CurrentRole=1..}]")
                user.runCommandAsync("tp @s[tag=sneaking] ~~~ facing @a[c=1,rm=1,m=a,scores={CurrentRole=1..}]")
                return
            }
        }, {
            id: 'jukebox',
            name: 0, type: 'use',
            use: function (user, item) {
                user.runCommandAsync("clear @s jukebox 0 1")
                user.runCommandAsync('give @s diamond 1 0 {"item_lock":{"mode":"lock_in_inventory"}}')
                return
            }
        }, {
            id: 'dark_oak_door',
            name: 0, type: 'use',
            use: function (user, item) {
                FORM.dokodemo_door(user)
                return
            }
        }, {
            id: 'feather', name: 0, type: 'use',
            use: function (user, item) {
                if (item.typeId == "minecraft:feather") {
                    if (user.hasTag("sneaking")) {
                        F.addKnockback(user, 40)
                        user.runCommandAsync("effect @s slow_falling 1 0 true")
                    } else {
                        F.addKnockback(user, 20)
                    }
                    user.runCommandAsync("clear @s feather 0 1")
                    return
                }
            }
        }, {
            id: 'wooden_button', name: 0, type: 'use',
            use: function (user, item) {
                user.runCommandAsync("execute as @a[scores={C4bomb=1},m=a] at @s run function werewolf/items/C4bomb_ON")
                user.runCommandAsync("execute as @e[type=item,tag=C4bomb] at @s run function werewolf/items/C4bomb_ON")
                return
            }
        }, {
            id: 'stick', name: 0, type: 'use',
            use: function (user, item) {
                let PL = world.getAllPlayers().find(e => e.id === user.id)
                if (item.nameTag == undefined) {
                    if (PL.isOp()) {
                        FORM.gameinfo(user)
                    } else {
                        if (PL.hasTag("player")) { PL.removeTag("player") } else { PL.addTag("player") }
                    }
                } else if (item.nameTag == '§r§fチャット') {
                    FORM.QC(user)
                } else if (item.nameTag == '§r§fヘルプ棒') {
                    FORM.Help(user)
                } else if (item.nameTag == '§r§f人狼チャット') {
                    FORM.WQ(user)
                }
                return
            }
        }, {
            id: 'purple_stained_glass_pane', name: 0, type: 'use',
            use: function (user, item) {
                user.runCommandAsync("scoreboard players set @s portal 150")
                user.runCommandAsync("kill @e[type=snow_golem,name=portal]")
                user.runCommandAsync("summon snow_golem portal")
                user.runCommandAsync("clear @s purple_stained_glass_pane 0 1")
                return
            }
        }, {
            id: 'echo_shard', name: 0, type: 'use',
            use: function (user, item) {
                for (let i = 1; i < 7; i++) {
                    user.runCommandAsync(`execute positioned ^^^${i * 2} run tag @a[m=a,r=${i},name=!${user.nameTag}] add shout`)
                }

                let Rotat = user.getRotation(), power = 50, theta = Rotat.y * 0.01745, yr = Rotat.x / -220 * power + 1, x = power * Math.sin(theta) * -1, z = power * Math.cos(theta),
                    PLs = world.getAllPlayers()
                user.runCommandAsync('effect @a[tag=shout] blindness 2 0 true')
                user.runCommandAsync('effect @a[tag=shout] slowness 1 3 true')
                for (let PL of PLs) {
                    if (PL.hasTag('shout')) {
                        PL.applyKnockback(x, z, power, yr)
                        PL.removeTag('shout')
                    }
                }
                user.runCommandAsync("playsound mob.wither.shoot @a[r=30] ~~~ 100 1.2")
                user.runCommandAsync("clear @s echo_shard 0 1")
                return
            }
        }
    ]

    //     static player_eye(user, item) {
    //         if (item.typeId == "minecraft:ender_eye") {
    //             user.runCommandAsync("clear @s ender_eye 0 1")
    //             user.runCommandAsync("effect @s blindness 1 0 true")
    //             user.runCommandAsync("tp @s[tag=!sneaking] ~~~ facing @a[c=-1,rm=1,m=a,scores={CurrentRole=1..}]")
    //             user.runCommandAsync("tp @s[tag=sneaking] ~~~ facing @a[c=1,rm=1,m=a,scores={CurrentRole=1..}]")
    //             return
    //         }
    //     }

    //     static jukebox(user, item) {
    //         if (item.typeId == "minecraft:jukebox") {
    //             user.runCommandAsync("clear @s jukebox 0 1")
    //             user.runCommandAsync('give @s diamond 1 0 {"item_lock":{"mode":"lock_in_inventory"}}')
    //             return
    //         }
    //     }

    //     static dark_oak_door(user, item) {
    //         if (item.typeId == "minecraft:dark_oak_door") {
    //             FORM.dokodemo_door(user)
    //             return
    //         }
    //     }

    //     static PoisonInjection(user, target) {
    //         if (user.hasTag("PoisonInjection")) {
    //             user.runCommandAsync("clear @s wither_rose 0 1")
    //             target.runCommandAsync("scoreboard players random @s poison 900 1800")
    //             return
    //         }
    //     }
    //     static ruin(user, target) {
    //         if (user.hasTag("ruin")) {
    //             user.runCommandAsync("summon lightning_bolt ~~~")
    //             user.runCommandAsync("damage @s 13 anvil")
    //             target.runCommandAsync("damage @s 30 anvil")
    //             user.runCommandAsync("clear golden_sword")
    //             return
    //         }
    //     }
    //     static C4bomb(user, target) {
    //         if (user.hasTag("C4bomb")) {
    //             target.runCommandAsync("scoreboard players set @s C4bomb 1")
    //             user.runCommandAsync("clear @s respawn_anchor 0 1")
    //             return
    //         }
    //     }

    //     static wooden_button(user, item) {
    //         if (item.typeId == "minecraft:wooden_button") {
    //             user.runCommandAsync("execute as @a[scores={C4bomb=1},m=a] at @s run function werewolf/items/C4bomb_ON")
    //             user.runCommandAsync("execute as @e[type=item,tag=C4bomb] at @s run function werewolf/items/C4bomb_ON")
    //             return
    //         }
    //     }
    //     static portal_set(user, item) {
    //         if (item.typeId == "minecraft:purple_stained_glass_pane") {
    //             user.runCommandAsync("scoreboard players set @s portal 150")
    //             user.runCommandAsync("kill @e[type=snow_golem,name=portal]")
    //             user.runCommandAsync("summon snow_golem portal")
    //             user.runCommandAsync("clear @s purple_stained_glass_pane 0 1")
    //             return
    //         }
    //     }
    //     static portal_use(user, target) {
    //         if (target.typeId == "minecraft:snow_golem" && target.nameTag == "portal") {
    //             user.runCommandAsync("effect @s blindness 1 0 true")
    //             user.runCommandAsync("tp @s @e[type=snow_golem,name=portal,c=-1]")
    //             return
    //         }
    //     }
    //     static feather(user, item) {
    //         if (item.typeId == "minecraft:feather") {
    //             if (user.hasTag("sneaking")) {
    //                 F.addKnockback(user, 40)
    //                 user.runCommandAsync("effect @s slow_falling 1 0 true")
    //             } else {
    //                 F.addKnockback(user, 20)
    //             }
    //             user.runCommandAsync("playsound mob.enderdragon.flap @s ~~~ 30 2.3")
    //             user.runCommandAsync("clear @s feather 0 1")
    //             return
    //         }
    //     }
    //     static shout(user, item) {
    //         if (item.typeId == "minecraft:echo_shard") {
    //             for (let i = 1; i < 7; i++) {
    //                 user.runCommandAsync(`execute positioned ^^^${i * 2} run tag @a[m=a,r=${i},name=!${user.nameTag}] add shout`)
    //             }

    //             let Rotat = user.getRotation(), power = 50, theta = Rotat.y * 0.01745, yr = Rotat.x / -220 * power + 1, x = power * Math.sin(theta) * -1, z = power * Math.cos(theta),
    //                 PLs = world.getAllPlayers()
    //             user.runCommandAsync('effect @a[tag=shout] blindness 2 0 true')
    //             user.runCommandAsync('effect @a[tag=shout] slowness 1 3 true')
    //             for (let PL of PLs) {
    //                 if (PL.hasTag('shout')) {
    //                     PL.applyKnockback(x, z, power, yr)
    //                     PL.removeTag('shout')
    //                 }
    //             }
    //             user.runCommandAsync("playsound mob.wither.shoot @a[r=30] ~~~ 100 1.2")
    //             user.runCommandAsync("clear @s echo_shard 0 1")
    //             return
    //         }
    //     }

    //     static GameFoam(user, item) {
    //         let PL = world.getAllPlayers().find(e => e.id === user.id);
    //         if (item.typeId == "minecraft:blaze_rod") {
    //             if (PL.isOp()) {
    //                 FORM.gameinfo(user)
    //             } else {
    //                 if (PL.hasTag("player")) { PL.removeTag("player") } else { PL.addTag("player") }
    //             }
    //         }
    //         return
    //     }

    //     static Qchat(user, item) {
    //         if (item.typeId == "minecraft:stick") {
    //             if (item?.nameTag == undefined) {
    //                 let PL = world.getAllPlayers().find(e => e.id === user.id);
    //                 if (PL.isOp()) {
    //                     FORM.gameinfo(user)
    //                 } else {
    //                     if (PL.hasTag("player")) { PL.removeTag("player") } else { PL.addTag("player") }
    //                 }
    //             }
    //         }
    //     ],
    , attack: [
        {
            id: undefined, attack: 'snow_golem', nametag: 'portal', name: 0, type: 'attack',
            use: function (user, item, target) {
                if (target.typeId == "minecraft:snow_golem" && target.nameTag == "portal") {
                    user.runCommandAsync("effect @s blindness 1 0 true")
                    user.runCommandAsync("tp @s @e[type=snow_golem,name=portal,c=-1]")
                    return
                }
            }
        },
        {
            id: 'wither_rose', attack: undefined, nametag: undefined, name: 0, type: 'attack',
            use: function (user, item, target) {
                user.runCommandAsync("clear @s wither_rose 0 1")
                target.runCommandAsync("scoreboard players random @s poison 900 1800")
                return
            }
        }, {
            id: 'golden_sword', attack: undefined, nametag: undefined, name: 0, type: 'attack',
            use: function (user, item, target) {
                user.runCommandAsync("summon lightning_bolt ~~~")
                user.runCommandAsync("damage @s 13 anvil")
                target.runCommandAsync("damage @s 30 anvil")
                user.runCommandAsync("clear golden_sword")
                return
            }
        }, {
            id: 'respawn_anchor', attack: undefined, nametag: undefined, name: 0, type: 'attack',
            use: function (user, item, target) {
                target.runCommandAsync("scoreboard players set @s C4bomb 1")
                user.runCommandAsync("clear @s respawn_anchor 0 1")
                return
            }
        },
        {
            id: 'redstone', attack: undefined, nametag: undefined, name: 0, type: 'attack',
            use: function (user, item, target) {
                target.runCommandAsync("function werewolf/ongame/puppet_powder")
                user.runCommandAsync("clear @s redstone 0 1")
                return
            }
        },
    ]
}