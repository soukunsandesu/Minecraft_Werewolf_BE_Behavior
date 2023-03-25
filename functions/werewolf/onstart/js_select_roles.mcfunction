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

tellraw @a { "rawtext": [  { "score": {"name": "人狼", "objective": "StartRoll" }}] }

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
tellraw @a[scores={CurrentRole=9}] {"rawtext":[{"text":"あなたの役職は§7狂信者§rです"}]}
execute if score 人狼 StartRoll matches 1.. run tellraw @a[scores={CurrentRole=9}] {"rawtext":[{"text":"人狼一覧: "}, {"selector":"@a[scores={CurrentRole=1}]"}]}
execute if score 大狼 StartRoll matches 1.. run tellraw @a[scores={CurrentRole=9}] {"rawtext":[{"text":"大狼一覧: "}, {"selector":"@a[scores={CurrentRole=10}]"}]}

tellraw @a[scores={CurrentRole=10}] {"rawtext":[{"text":"あなたの役職は§4大狼§rです"}]}
tellraw @a[scores={CurrentRole=11}] {"rawtext":[{"text":"あなたの役職は§4賢狼§rです"}]}
