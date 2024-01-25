scoreboard players remove @s[tag=moving] portal 1
execute as @s[scores={portal=..0}] at @s run summon snow_golem portal
titleraw @s times 0 20 20
titleraw @s title {"rawtext":[{"score":{"name":"@s","objective":"portal"}}]}
scoreboard players reset @s[scores={portal=..0}] portal