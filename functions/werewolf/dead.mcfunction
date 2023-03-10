
# execute as @s[scores={CurrentRole=1}] run scoreboard players remove MWSystem NumOfWolf 1
# execute as @s[scores={CurrentRole=3..5}] run scoreboard players remove MWSystem NumOfVillagers 1
scoreboard players set @s a_live 0
gamemode spectator @s

tag @e[type=player] remove dead_t