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
execute as @e[scores={lover=1..}] run scoreboard players add 恋人 StartRoll 1
scoreboard players operation 恋人 StartRoll /= score2 time

##判定値追加
scoreboard players set MWSystem NumOfWolf 0
scoreboard players set MWSystem NumOfVillagers 0
scoreboard players set MWSystem NumOfFox 0
scoreboard players set MWSystem NumOfLover 0

# 人狼陣営=1
scoreboard players set @a[scores={CurrentRole=1}] team 1
scoreboard players set @a[scores={CurrentRole=10..11}] team 1
execute as @a[scores={team=1}] run scoreboard players add MWSystem NumOfWolf 1
execute if score MWSystem NumOfWolf matches 2.. run tellraw @a[scores={team=1}] {"rawtext":[{"text":"人狼一覧: "}, {"selector":"@a[scores={team=1}]"}]}
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
scoreboard players set @a[scores={CurrentRole=14}] team 3
execute as @a[scores={team=3,lover=0}] run scoreboard players add MWSystem NumOfVillagers 1

# 狐陣営=4
scoreboard players set @a[scores={CurrentRole=8}] team 4
execute as @a[scores={team=4}] run scoreboard players add MWSystem NumOfFox 1

# 恋人
execute as @a[scores={lover=1..}] run scoreboard players add MWSystem NumOfLover 1

execute as @a[tag=player] run scoreboard players operation @s Previewteam = @s team

#Debuggerは役職配布直後にsummary表示
execute as @a[tag=Debugger] run function werewolf/summary

function werewolf/onstart/roles_list
tellraw @a[scores={CurrentRole=1}] {"rawtext":[{"text":"あなたの役職は§4人狼§rです"}]}
tellraw @a[scores={CurrentRole=2}] {"rawtext":[{"text":"あなたの役職は§5狂人§rです"}]}
tellraw @a[scores={CurrentRole=3}] {"rawtext":[{"text":"あなたの役職は§b預言者§rです"}]}
tellraw @a[scores={CurrentRole=4}] {"rawtext":[{"text":"あなたの役職は§e霊媒師§rです"}]}
tellraw @a[scores={CurrentRole=5}] {"rawtext":[{"text":"あなたの役職は§a村人§rです"}]}
tellraw @a[scores={CurrentRole=6}] {"rawtext":[{"text":"あなたの役職は§b怪盗§rです"}]}
tellraw @a[scores={CurrentRole=7}] {"rawtext":[{"text":"あなたの役職は§g猫又§rです"}]}
tellraw @a[scores={CurrentRole=8}] {"rawtext":[{"text":"あなたの役職は§e狐§rです"}]}
tellraw @a[scores={CurrentRole=9}] {"rawtext":[{"text":"あなたの役職は§7狂信者§rです"}]}
tellraw @a[scores={CurrentRole=10}] {"rawtext":[{"text":"あなたの役職は§4大狼§rです"}]}
tellraw @a[scores={CurrentRole=11}] {"rawtext":[{"text":"あなたの役職は§4賢狼§rです"}]}
tellraw @a[scores={CurrentRole=12}] {"rawtext":[{"text":"あなたの役職は§6パン屋§rです"}]}
tellraw @a[scores={CurrentRole=13}] {"rawtext":[{"text":"あなたの役職は§7囁く狂人§rです"}]}
tellraw @a[scores={CurrentRole=14}] {"rawtext":[{"text":"あなたの役職は§a村人§rです"}]}

tellraw @a[scores={lover=1}] {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=1}]"},{"text":"ペア"}]}
tellraw @a[scores={lover=2}] {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=2}]"},{"text":"ペア"}]}
tellraw @a[scores={lover=3}] {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=3}]"},{"text":"ペア"}]}
tellraw @a[scores={lover=4}] {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=4}]"},{"text":"ペア"}]}
tellraw @a[scores={lover=5}] {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=5}]"},{"text":"ペア"}]}


