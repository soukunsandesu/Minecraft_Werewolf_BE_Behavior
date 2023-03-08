scoreboard players add @a elevator 0

execute as @p if score MWSystem time matches 0.. run titleraw @a actionbar {"rawtext":[{"score":{"name":"MWSystem","objective":"time"}}]}

execute as @a[scores={elevator=..0}] at @s if block ~~-2~ lodestone if block ~~4~ lodestone run tag @s add Eup
execute as @a[tag=sneaking,scores={elevator=..0}] at @s if block ~~-1~ lodestone if block ~~-7~ lodestone run tag @s add Edown
# execute as @a at @s[tag=jumping] if block ~~-1~ lodestone if block ~~5~ lodestone run tp @s ~~5.25~ true
execute as @a[tag=Eup] at @s run tp @s ~~5~ true
execute as @a[tag=Edown] at @s run tp @s ~~-6~ true

scoreboard players set @a[tag=Eup] elevator 30
scoreboard players set @a[tag=Edown] elevator 30
tag @a remove Eup
tag @a remove Edown
scoreboard players remove @a[scores={elevator=1..}] elevator 1
execute as @e[type=playerm=a] at @s run spawnpoint @s ~~~

# 死亡判定
tag @a add dead
tag @e[type=player] remove dead
execute as @e[type=player,tag=dead_t,scores={CurrentRole=1}] run scoreboard players remove MWSystem NumOfWolf 1
execute as @e[type=player,tag=dead_t,scores={CurrentRole=3..5}] run scoreboard players remove MWSystem NumOfVillagers 1
gamemode spectator @e[type=player,m=a,tag=dead_t]
tag @e[type=player] remove dead_t
tag @a[tag=dead] add dead_t
tag @a[m=spectator] add spectator
tag @a[m=!spectator] remove spectator


function werewolf/skull
scoreboard players remove @a[scores={poison=1..}] poison 1
effect @a[scores={poison=..0}] wither 120 0
scoreboard players reset @a[scores={poison=..0}] poison

tag @a remove PoisonInjection
tag @a[hasitem={item=wither_rose,location=slot.weapon.mainhand}] add PoisonInjection
effect @a[tag=PoisonInjection] weakness 1 10 true
tag @a remove ruin
tag @a[hasitem={item=golden_sword,location=slot.weapon.mainhand}] add ruin

execute as @a[scores={CurrentRole=3..},hasitem={item=beacon},m=a] at @s run function werewolf/mine


execute as @a[hasitem={item=quartz_block},m=a] run function werewolf/quartz_give


# 勝利判定
execute if score MWSystem NumOfWolf matches 0 if score MWSystem NumOfVillagers matches 1.. as @p run function werewolf/onfinish/winner/villager
execute if score MWSystem NumOfVillagers matches 0 if score MWSystem NumOfWolf matches 1.. as @p run function werewolf/onfinish/winner/werewolf
execute if score MWSystem NumOfWolf matches 0 if score MWSystem NumOfVillagers matches 0 as @p run function werewolf/onfinish/winner/draw