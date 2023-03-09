
execute if score MWSystem NumOfWolf matches 0 if score MWSystem NumOfVillagers matches 1.. as @p run function werewolf/onfinish/winner/villager
execute if score MWSystem NumOfVillagers matches 0 if score MWSystem NumOfWolf matches 1.. as @p run function werewolf/onfinish/winner/werewolf
execute if score MWSystem NumOfWolf matches 0 if score MWSystem NumOfVillagers matches 0 as @p run function werewolf/onfinish/winner/draw