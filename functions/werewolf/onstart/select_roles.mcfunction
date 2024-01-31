# ロール付与
# scoreboard players set @a[tag=player] CurrentRole 0
#scoreboard players set @r[scores={CurrentRole=0}] CurrentRole 1ではダメ？
# 人狼 = 1
# execute as @r[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 1
# 狂人 = 2
# execute as @r[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 2

# 預言者 = 3
# execute as @r[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 3
# 霊媒師 = 4
# execute as @r[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 4
# # 怪盗 = 6
# execute as @r[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 6
# # 猫又 = 7
# execute as @r[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 7
# # 猫又 = 8
# execute as @r[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 8

# 人数取得
scoreboard players set MWSystem NumOfPlayers 0
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
execute as @e[scores={CurrentRole=21}] run scoreboard players add カウンセラー StartRoll 1

##判定値追加
scoreboard players set MWSystem NumOfWolf 0
scoreboard players set MWSystem NumOfVillagers 0
scoreboard players set MWSystem NumOfFox 0
execute as @a[scores={CurrentRole=1}] run scoreboard players add MWSystem NumOfWolf 1
execute as @a[scores={CurrentRole=10}] run scoreboard players add MWSystem NumOfWolf 1
execute as @a[scores={CurrentRole=3..7}] run scoreboard players add MWSystem NumOfVillagers 1
execute as @a[scores={CurrentRole=8}] run scoreboard players add MWSystem NumOfFox 1


#Debuggerは役職配布直後にsummary表示
execute as @a[tag=Debugger] run function werewolf/summary

tellraw @a {"rawtext":[{"text":"プレイヤー数: "},{"score":{"name": "MWSystem","objective":"NumOfPlayers"}}]}
tellraw @a {"rawtext":[{"text":"人狼の人数: "},{"score":{"name": "MWSystem","objective":"NumOfWolf"}}]}

tellraw @a[scores={CurrentRole=1}] {"rawtext":[{"text":"あなたの役職は§4人狼§rです"}]}
execute if score MWSystem NumOfWolf matches 2.. run tellraw @a[scores={CurrentRole=1}] {"rawtext":[{"text":"人狼一覧: "}, {"selector":"@a[scores={CurrentRole=1}]"}]}

tellraw @a[scores={CurrentRole=2}] {"rawtext":[{"text":"あなたの役職は§5狂人§rです"}]}
tellraw @a[scores={CurrentRole=3}] {"rawtext":[{"text":"あなたの役職は§b預言者§rです"}]}
tellraw @a[scores={CurrentRole=4}] {"rawtext":[{"text":"あなたの役職は§e霊媒師§rです"}]}
tellraw @a[scores={CurrentRole=5}] {"rawtext":[{"text":"あなたの役職は§a村人§rです"}]}
tellraw @a[scores={CurrentRole=6}] {"rawtext":[{"text":"あなたの役職は§b怪盗§rです"}]}
tellraw @a[scores={CurrentRole=7}] {"rawtext":[{"text":"あなたの役職は§g猫又§rです"}]}
tellraw @a[scores={CurrentRole=8}] {"rawtext":[{"text":"あなたの役職は§e狐§rです"}]}
tellraw @a[scores={CurrentRole=9}] {"rawtext":[{"text":"あなたの役職は§7狂信者§rです\n人狼一覧:"}, {"selector":"@a[scores={CurrentRole=1}]"}]}


# tellraw @a[scores={CurrentRole=10}] {"rawtext":[]}
