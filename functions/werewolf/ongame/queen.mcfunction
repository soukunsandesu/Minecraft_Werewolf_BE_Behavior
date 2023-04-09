# deadから起動
tag @a[scores={team=3,a_live=1}]  add dead_queen
tellraw @a[tag=dead_queen] {"rawtext":[{"text":"§d女王§r(§g"},{"selector":"@s"},{"text": "§r)が死亡した"}]}
tellraw @a[m=!a] {"rawtext":[{"text":"§d女王§r(§g"},{"selector":"@s"},{"text": "§r)が死亡した"}]}
execute as @r[scores={CurrentRole=16,a_live=1}] run function werewolf/ongame/princess
kill @a[tag=dead_queen]
tag @a remove dead_queen