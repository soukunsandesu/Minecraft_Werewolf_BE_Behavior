scoreboard players remove MWSystem time 1
execute if score MWSystem time matches -1.. as @p run scoreboard players operation クォーツタイマー time = MWSystem time
execute if score MWSystem time matches -1.. as @p run scoreboard players operation クォーツタイマー time %= クォーツ間隔 time

execute if score クォーツタイマー time matches 0 as @a run function werewolf/ongame/quartz
execute if score MWSystem time matches 0 as @a run give @s quartz 4


execute as @p[scores={CurrentRole=12,a_live=1}] run function werewolf/ongame/panya

execute if score MWSystem time <= 怪盗リミット time as @a[scores={CurrentRole=6,a_live=1}] run function werewolf/ongame/thief
