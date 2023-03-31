# 20tickから起動
scoreboard players operation パン屋タイマー time = MWSystem time
scoreboard players operation パン屋タイマー time %= score150 time
execute if score パン屋タイマー time matches 0 as @a[scores={CurrentRole=12,a_live=1}] run give @a bread 1