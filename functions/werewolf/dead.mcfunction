
execute as @s[scores={CurrentRole=1}] run scoreboard players remove MWSystem NumOfWolf 1
execute as @s[scores={CurrentRole=3..7}] run scoreboard players remove MWSystem NumOfVillagers 1
execute as @s[scores={CurrentRole=8}] run scoreboard players remove MWSystem NumOfFox 1
scoreboard players set @s a_live 0
gamemode spectator @s
execute if entity @s[scores={PreviewRole=7}] run function werewolf/ongame/nekomata
tag @e[type=player] remove dead_t