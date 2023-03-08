function werewolf/onfinish/reset

scoreboard objectives add elevator dummy
scoreboard objectives add poison dummy
scoreboard objectives add skull dummy
scoreboard objectives add time dummy
scoreboard players set MWSystem time 600
scoreboard objectives add PreviewRole dummy
scoreboard objectives add CurrentRole dummy
execute as @a run scoreboard players set @s CurrentRole 0
# プレイヤー数カウント
scoreboard objectives add NumOfPlayers dummy
execute as @a run scoreboard players add MWSystem NumOfPlayers 1
# 役職生存数カウント
scoreboard objectives add NumOfWolf dummy
scoreboard objectives add NumOfVillagers dummy
scoreboard players set MWSystem NumOfWolf 0
scoreboard players set MWSystem NumOfVillagers 0

