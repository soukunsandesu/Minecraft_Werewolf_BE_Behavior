scoreboard players remove MWSystem time 1
execute if score MWSystem time matches 0 as @a run give @s quartz 4
execute if score MWSystem time matches 150 as @a run give @s quartz
execute if score MWSystem time matches 150 as @a[scores={team=1}] run replaceitem entity @s slot.inventory 20 quartz
execute if score MWSystem time matches 300 as @a run give @s quartz
execute if score MWSystem time matches 300 as @a[scores={team=1}] run replaceitem entity @s slot.inventory 19 quartz
execute if score MWSystem time matches 450 as @a run give @s quartz
execute if score MWSystem time matches 450 as @a[scores={team=1}] run replaceitem entity @s slot.inventory 18 quartz

execute if entity @a[scores={CurrentRole=12}] run function werewolf/ongame/panya