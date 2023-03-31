scoreboard players remove MWSystem time 1
execute if score MWSystem time matches -1.. as @p run scoreboard players operation クォーツタイマー time = MWSystem time
execute if score MWSystem time matches -1.. as @p run scoreboard players operation クォーツタイマー time %= score150 time

execute if score クォーツタイマー time matches 0 as @a run give @s quartz
execute if score MWSystem time matches 0 as @a run give @s quartz 3

execute if score MWSystem time matches 150 as @a[scores={Previewteam=1}] run replaceitem entity @s slot.inventory 20 quartz
execute if score MWSystem time matches 300 as @a[scores={Previewteam=1}] run replaceitem entity @s slot.inventory 19 quartz
execute if score MWSystem time matches 450 as @a[scores={Previewteam=1}] run replaceitem entity @s slot.inventory 18 quartz
execute as @p[scores={CurrentRole=12,a_live=1}] run function werewolf/ongame/panya