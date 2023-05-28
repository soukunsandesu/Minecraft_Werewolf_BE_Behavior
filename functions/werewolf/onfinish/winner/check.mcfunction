# 1tickから起動 村or人狼が全滅すると起動

# 恋人勝利判定
execute if score MWSystem NumOfLover matches 1.. as @p run function werewolf/onfinish/winner/lover

# 狐勝利判定
execute if score MWSystem NumOfFox matches 1.. as @p run function werewolf/onfinish/winner/fox

# ボマー勝利判定
execute if score MWSystem NumOfWolf matches 0 if score MWSystem NumOfVillagers matches 0 if score MWSystem NumOfBomber matches 1.. as @p run function werewolf/onfinish/winner/bomber

# 村・人狼勝利判定
execute if score MWSystem NumOfVillagers matches 1.. if score MWSystem NumOfBomber matches 0 as @p run function werewolf/onfinish/winner/villager
execute if score MWSystem NumOfWolf matches 1.. if score MWSystem NumOfBomber matches 0 as @p run function werewolf/onfinish/winner/werewolf
execute if score MWSystem NumOfWolf matches 0 if score MWSystem NumOfVillagers matches 0 as @p run function werewolf/onfinish/winner/draw
