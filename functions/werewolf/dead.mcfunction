execute as @s[scores={CurrentRole=1}] run scoreboard players remove MWSystem NumOfWolf 1
execute as @s[scores={CurrentRole=3..7}] run scoreboard players remove MWSystem NumOfVillagers 1
execute as @s[scores={CurrentRole=8}] run scoreboard players remove MWSystem NumOfFox 1
scoreboard players set @s a_live 0
gamemode spectator @s
execute if entity @s[scores={CurrentRole=7}] as @r[scores={a_live=1}] run function werewolf/ongame/nekomata
execute if entity @s[scores={CurrentRole=7}] run tellraw @a[tag=dead_cat] {"rawtext":[{"text":"猫又(§g"},{"selector":"@s"},{"text": "§r)による道連れに巻き込まれた。"}]}
tag @a remove dead_cat

function werewolf/summary