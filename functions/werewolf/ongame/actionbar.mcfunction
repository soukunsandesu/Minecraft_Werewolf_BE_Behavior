# 1tickから
execute as @s if score MWSystem time matches 0.. run function werewolf/ongame/actionbar_timer_on
execute as @s if score MWSystem time matches ..-1 run function werewolf/ongame/actionbar_timer_off