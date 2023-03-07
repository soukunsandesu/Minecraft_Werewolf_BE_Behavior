function werewolf/reset

scoreboard objectives add elevator dummy
scoreboard objectives add poison dummy
scoreboard objectives add skull dummy
scoreboard objectives add PreviewRole dummy
scoreboard objectives add CurrentRole dummy
execute as @a run scoreboard players set @s CurrentRole 0

# プレイヤー数カウント
scoreboard objectives add NumOfPlayers dummy
execute as @a run scoreboard players add MWSystem NumOfPlayers 1
