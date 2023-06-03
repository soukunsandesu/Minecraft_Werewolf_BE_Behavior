# ロール付与

# 人数取得
execute as @a[tag=player] run scoreboard players add MWSystem NumOfPlayers 1

# 村人 = 5
execute as @a[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 5

execute as @a[tag=player] run scoreboard players operation @s PreviewRole = @s CurrentRole
execute as @a[tag=player] run scoreboard players operation @s StartRoll = @s CurrentRole

# 観戦の追加 1tickで観戦にも時間を表示するため
scoreboard players add @a CurrentRole 0
execute as @e[scores={CurrentRole=1}] run scoreboard players add 人狼 StartRoll 1
execute as @e[scores={CurrentRole=2}] run scoreboard players add 狂人 StartRoll 1
execute as @e[scores={CurrentRole=3}] run scoreboard players add 預言者 StartRoll 1
execute as @e[scores={CurrentRole=4}] run scoreboard players add 霊媒師 StartRoll 1
execute as @e[scores={CurrentRole=5}] run scoreboard players add 村人 StartRoll 1
execute as @e[scores={CurrentRole=6}] run scoreboard players add 怪盗 StartRoll 1
execute as @e[scores={CurrentRole=7}] run scoreboard players add 猫又 StartRoll 1
execute as @e[scores={CurrentRole=8}] run scoreboard players add 狐 StartRoll 1
execute as @e[scores={CurrentRole=9}] run scoreboard players add 狂信者 StartRoll 1
execute as @e[scores={CurrentRole=10}] run scoreboard players add 大狼 StartRoll 1
execute as @e[scores={CurrentRole=11}] run scoreboard players add 賢狼 StartRoll 1
execute as @e[scores={CurrentRole=12}] run scoreboard players add パン屋 StartRoll 1
execute as @e[scores={CurrentRole=13}] run scoreboard players add 囁く狂人 StartRoll 1
execute as @e[scores={CurrentRole=14}] run scoreboard players add 狼付き StartRoll 1
execute as @e[scores={CurrentRole=15}] run scoreboard players add 女王 StartRoll 1
execute as @e[scores={CurrentRole=16}] run scoreboard players add プリンセス StartRoll 1
execute as @e[scores={CurrentRole=17}] run scoreboard players add 狩人 StartRoll 1
execute as @e[scores={CurrentRole=18}] run scoreboard players add ボマー StartRoll 1
execute as @e[scores={CurrentRole=19}] run scoreboard players add 光の使徒 StartRoll 1
execute as @e[scores={CurrentRole=20}] run scoreboard players add 闇の化身 StartRoll 1

execute as @e[scores={lover=1..}] run scoreboard players add 恋人 StartRoll 1
scoreboard players operation 恋人 StartRoll /= score2 time

function werewolf/onstart/roles_list

# 光の使徒による変化
execute as @a[scores={CurrentRole=19}] run function werewolf/ongame/hikarinosito
# 闇の化身による変化
execute as @a[scores={CurrentRole=20}] run function werewolf/ongame/yaminokesin

##判定値追加
scoreboard players set MWSystem NumOfWolf 0
scoreboard players set MWSystem NumOfVillagers 0
scoreboard players set MWSystem NumOfFox 0
scoreboard players set MWSystem NumOfLover 0

# 人狼陣営=1
scoreboard players set @a[scores={CurrentRole=1}] team 1
scoreboard players set @a[scores={CurrentRole=10..11}] team 1
execute as @a[scores={team=1}] run scoreboard players add MWSystem NumOfWolf 1
scoreboard players set @a[scores={team=1}] WolfC 1

# 判定外陣営=2
# 狂人など
scoreboard players set @a[scores={CurrentRole=2}] team 2
scoreboard players set @a[scores={CurrentRole=9}] team 2
scoreboard players set @a[scores={CurrentRole=13}] team 2
scoreboard players set @a[scores={CurrentRole=13}] WolfC 1

# 市民陣営=3
scoreboard players set @a[scores={CurrentRole=3..7}] team 3
scoreboard players set @a[scores={CurrentRole=12}] team 3
scoreboard players set @a[scores={CurrentRole=14..17}] team 3
execute as @a[scores={team=3,lover=0}] run scoreboard players add MWSystem NumOfVillagers 1

# 狐陣営=4
scoreboard players set @a[scores={CurrentRole=8}] team 4
execute as @a[scores={team=4}] run scoreboard players add MWSystem NumOfFox 1

# ボマー陣営=5
scoreboard players set @a[scores={CurrentRole=18}] team 5
execute as @a[scores={team=5}] run scoreboard players add MWSystem NumOfBomber 1

# 恋人
execute as @a[scores={lover=1..}] run scoreboard players add MWSystem NumOfLover 1

execute as @a[tag=player] run scoreboard players operation @s Previewteam = @s team

#Debuggerは役職配布直後にsummary表示
execute as @a[tag=Debugger] run function werewolf/summary

tellraw @a[tag=!No_tell,scores={CurrentRole=1}] {"rawtext":[{"text":"あなたの役職は§4人狼§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=2}] {"rawtext":[{"text":"あなたの役職は§5狂人§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=3}] {"rawtext":[{"text":"あなたの役職は§b預言者§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=4}] {"rawtext":[{"text":"あなたの役職は§e霊媒師§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=5}] {"rawtext":[{"text":"あなたの役職は§a村人§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=6}] {"rawtext":[{"text":"あなたの役職は§b怪盗§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=7}] {"rawtext":[{"text":"あなたの役職は§g猫又§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=8}] {"rawtext":[{"text":"あなたの役職は§e狐§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=9}] {"rawtext":[{"text":"あなたの役職は§7狂信者§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=10}] {"rawtext":[{"text":"あなたの役職は§4大狼§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=11}] {"rawtext":[{"text":"あなたの役職は§4賢狼§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=12}] {"rawtext":[{"text":"あなたの役職は§6パン屋§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=13}] {"rawtext":[{"text":"あなたの役職は§7囁く狂人§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=14}] {"rawtext":[{"text":"あなたの役職は§a村人§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=15}] {"rawtext":[{"text":"あなたの役職は§d女王§rです"}]}
execute if entity @a[scores={CurrentRole=15}] as @p run tellraw @a[scores={team=3}] {"rawtext":[{"text":"§d女王§rは"},{"selector":"@a[scores={CurrentRole=15}]"},{"text":"です"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=16}] {"rawtext":[{"text":"あなたの役職は§dプリンセス§rです"}]}
execute if entity @a[scores={CurrentRole=16}] as @p run tellraw @a[scores={CurrentRole=15}] {"rawtext":[{"text":"§dプリンセス§rは"},{"selector":"@a[scores={CurrentRole=16}]"},{"text":"です"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=17}] {"rawtext":[{"text":"あなたの役職は§a狩人§rです"}]}
tellraw @a[tag=!No_tell,scores={CurrentRole=18}] {"rawtext":[{"text":"あなたの役職は§7ボマー§rです"}]}
execute as @a[scores={CurrentRole=18}] run function werewolf/items/give_bomb
tag @a remove No_tell

execute if score MWSystem NumOfWolf matches 2.. run tellraw @a[scores={team=1}] {"rawtext":[{"text":"人狼一覧: "}, {"selector":"@a[scores={team=1}]"}]}
execute if score MWSystem NumOfBomber matches 2.. run tellraw @a[scores={team=5}] {"rawtext":[{"text":"ボマー一覧: "}, {"selector":"@a[scores={team=5}]"}]}

tellraw @a[scores={lover=1}] {"rawtext":[{"text":"あなたは§d恋人§rです\n"},{"selector":"@a[scores={lover=1}]"},{"text":"ペア"}]}
tellraw @a[scores={lover=2}] {"rawtext":[{"text":"あなたは§d恋人§rです\n"},{"selector":"@a[scores={lover=2}]"},{"text":"ペア"}]}
tellraw @a[scores={lover=3}] {"rawtext":[{"text":"あなたは§d恋人§rです\n"},{"selector":"@a[scores={lover=3}]"},{"text":"ペア"}]}
tellraw @a[scores={lover=4}] {"rawtext":[{"text":"あなたは§d恋人§rです\n"},{"selector":"@a[scores={lover=4}]"},{"text":"ペア"}]}
tellraw @a[scores={lover=5}] {"rawtext":[{"text":"あなたは§d恋人§rです\n"},{"selector":"@a[scores={lover=5}]"},{"text":"ペア"}]}

