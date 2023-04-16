# 実行者:死亡したplayer
tag @s[scores={hunter=1..}] add Avo_dead
scoreboard players reset @s[scores={hunter=1..}] hunter

# 死を回避した場合
execute as @s[tag=Avo_dead] run function werewolf/ongame/dead_avo
# 死亡した場合
execute as @s[tag=!Avo_dead] run function werewolf/ongame/dead_run
tag @s remove Avo_dead