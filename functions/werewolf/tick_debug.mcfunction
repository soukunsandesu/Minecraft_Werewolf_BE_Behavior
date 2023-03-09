scoreboard players set debug NumOfWolf 0
scoreboard players set debug NumOfVillagers 0
execute as @e[scores={CurrentRole=1}] run scoreboard players add debug NumOfWolf 1
execute as @e[scores={CurrentRole=3..5}] run scoreboard players add debug NumOfVillagers 1


execute if score debug NumOfWolf matches 0 if score debug NumOfVillagers matches 1.. as @p run function werewolf/onfinish/winner/villager
execute if score debug NumOfVillagers matches 0 if score debug NumOfWolf matches 1.. as @p run function werewolf/onfinish/winner/werewolf
execute if score debug NumOfWolf matches 0 if score debug NumOfVillagers matches 0 as @p run function werewolf/onfinish/winner/draw