# 実行者:死亡したplayer
execute as @s[scores={team=1}] run scoreboard players remove MWSystem NumOfWolf 1
execute as @s[scores={team=3}] run scoreboard players remove MWSystem NumOfVillagers 1
execute as @s[scores={team=4}] run scoreboard players remove MWSystem NumOfFox 1
scoreboard players set @s a_live 0
gamemode spectator @s

# 猫又
execute if entity @s[scores={CurrentRole=7}] run function werewolf/ongame/nekomata

# 賢狼
execute if entity @a[scores={CurrentRole=11}] run function werewolf/ongame/kenrou

# 恋人
execute if entity @s[scores={lover=1..}] run function werewolf/ongame/lover

function werewolf/summary
