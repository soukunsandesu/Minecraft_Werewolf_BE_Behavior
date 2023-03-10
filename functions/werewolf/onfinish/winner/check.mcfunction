# scoreboard players set MWSystem NumOfWolf 0
# scoreboard players set MWSystem NumOfVillagers 0
# scoreboard players set MWSystem NumOfFox 0
# execute as @e[scores={CurrentRole=1}] run scoreboard players add MWSystem NumOfWolf 1
# execute as @e[scores={CurrentRole=3..7}] run scoreboard players add MWSystem NumOfVillagers 1
# execute as @e[scores={CurrentRole=8}] run scoreboard players add MWSystem NumOfFox 1


execute if score MWSystem NumOfFox matches 1.. if score MWSystem NumOfWolf matches 0 if score MWSystem NumOfVillagers matches 1.. as @p run function werewolf/onfinish/winner/fox
execute if score MWSystem NumOfFox matches 1.. if score MWSystem NumOfVillagers matches 0 if score MWSystem NumOfWolf matches 1.. as @p run function werewolf/onfinish/winner/fox
execute if score MWSystem NumOfFox matches 1.. if score MWSystem NumOfVillagers matches 0 if score MWSystem NumOfWolf matches 0 as @p run function werewolf/onfinish/winner/fox

execute if score MWSystem NumOfFox matches 0 if score MWSystem NumOfWolf matches 0 if score MWSystem NumOfVillagers matches 1.. as @p run function werewolf/onfinish/winner/villager
execute if score MWSystem NumOfFox matches 0 if score MWSystem NumOfVillagers matches 0 if score MWSystem NumOfWolf matches 1.. as @p run function werewolf/onfinish/winner/werewolf
execute if score MWSystem NumOfFox matches 0 if score MWSystem NumOfWolf matches 0 if score MWSystem NumOfVillagers matches 0 as @p run function werewolf/onfinish/winner/draw