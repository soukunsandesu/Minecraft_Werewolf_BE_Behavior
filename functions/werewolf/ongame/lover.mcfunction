# dead_runから起動
execute if entity @s[scores={lover=1}] run tag @a[scores={lover=1,a_live=1}] add dead_lover
execute if entity @s[scores={lover=2}] run tag @a[scores={lover=2,a_live=1}] add dead_lover
execute if entity @s[scores={lover=3}] run tag @a[scores={lover=3,a_live=1}] add dead_lover
execute if entity @s[scores={lover=4}] run tag @a[scores={lover=4,a_live=1}] add dead_lover
execute if entity @s[scores={lover=5}] run tag @a[scores={lover=5,a_live=1}] add dead_lover
tag @a[tag=dead_lover] add kill
tellraw @a[tag=dead_lover] {"rawtext":[{"selector":"@a[tag=dead_lover]"},{"text": "§rは"},{"selector":"@s"},{"text": "§rが死亡したので後追いした…"}]}
scoreboard players remove MWSystem NumOfLover 1
tag @a remove dead_lover