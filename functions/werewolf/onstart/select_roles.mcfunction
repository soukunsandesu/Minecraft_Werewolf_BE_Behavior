# 人狼 = 1
execute as @r[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 1
# 狂人 = 2
execute as @r[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 2

# 預言者 = 3
execute as @r[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 3
# 霊媒師 = 4
execute as @r[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 4

## 追加の人狼
# 5人から人狼を1人増やす
execute if score MWSystem NumOfPlayers matches 5.. as @r[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 1
# 10人から人狼を1人増やす
execute if score MWSystem NumOfPlayers matches 10.. as @r[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 1

# 村人 = 5
execute as @a[scores={CurrentRole=0}] run scoreboard players set @s CurrentRole 5

execute as @a run scoreboard players operation @s PreviewRole = @s CurrentRole

##判定値追加
execute as @a[scores={CurrentRole=1}] run scoreboard players add MWSystem NumOfWolf 1
execute as @a[scores={CurrentRole=3..5}] run scoreboard players add MWSystem NumOfVillagers 1



#Debuggerは役職配布直後にsummary表示
execute as @a[tag=Debugger] run function werewolf/summary
