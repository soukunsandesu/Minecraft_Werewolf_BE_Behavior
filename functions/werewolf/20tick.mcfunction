scoreboard players remove MWSystem time 1
execute as @p run scoreboard players operation クォーツタイマー time = MWSystem time
execute as @p run scoreboard players operation クォーツタイマー time %= クォーツ間隔 time

execute if score MWSystem time matches -1.. if score クォーツタイマー time matches 0 as @a run function werewolf/ongame/quartz

# ボマー用
execute if score クォーツタイマー time matches 0 as @a[scores={CurrentRole=18}] run loot give @s loot "give_items/respawn_anchor"


execute if score MWSystem time matches 0 as @a run give @s quartz 4




execute as @p[scores={CurrentRole=12,a_live=1}] run function werewolf/ongame/panya

execute if score MWSystem time <= 怪盗リミット time as @a[scores={CurrentRole=6,a_live=1}] run function werewolf/ongame/thief
