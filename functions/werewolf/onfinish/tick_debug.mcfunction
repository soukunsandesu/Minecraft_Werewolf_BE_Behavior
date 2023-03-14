scoreboard players set debug NumOfWolf 0
scoreboard players set debug NumOfVillagers 0
scoreboard players set debug NumOfFox 0
execute as @e[scores={CurrentRole=8}] run scoreboard players add debug NumOfFox 1
execute as @e[scores={CurrentRole=1}] run scoreboard players add debug NumOfWolf 1
execute as @e[scores={CurrentRole=3..7}] run scoreboard players add debug NumOfVillagers 1

scoreboard players set @e[scores={CurrentRole=1..},type=armor_stand] a_live 1
scoreboard players set @e[scores={CurrentRole=1..},hasitem={item=diamond},type=armor_stand] a_live 0

execute if score debug NumOfFox matches 1.. if score debug NumOfWolf matches 0 if score debug NumOfVillagers matches 1.. as @p run function werewolf/onfinish/winner/fox
execute if score debug NumOfFox matches 1.. if score debug NumOfVillagers matches 0 if score debug NumOfWolf matches 1.. as @p run function werewolf/onfinish/winner/fox
execute if score debug NumOfFox matches 1.. if score debug NumOfVillagers matches 0 if score debug NumOfWolf matches 0 as @p run function werewolf/onfinish/winner/fox

execute if score debug NumOfFox matches 0 if score debug NumOfWolf matches 0 if score debug NumOfVillagers matches 1.. as @p run function werewolf/onfinish/winner/villager
execute if score debug NumOfFox matches 0 if score debug NumOfVillagers matches 0 if score debug NumOfWolf matches 1.. as @p run function werewolf/onfinish/winner/werewolf
execute if score debug NumOfFox matches 0 if score debug NumOfWolf matches 0 if score debug NumOfVillagers matches 0 as @p run function werewolf/onfinish/winner/draw