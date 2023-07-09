scoreboard objectives add give_item dummy
scoreboard players set @a[tag=player] give_item 0
execute as @a[scores={give_item=0}] run scoreboard players random @s give_item 1 10
loot give @a[scores={give_item=1}] loot "give_items/double_plant"
loot give @a[scores={give_item=2}] loot "give_items/ender_eye"
loot give @a[scores={give_item=2}] loot "give_items/ender_eye"
loot give @a[scores={give_item=2}] loot "give_items/ender_eye"
loot give @a[scores={give_item=3}] loot "give_items/potion7"
loot give @a[scores={give_item=4}] loot "give_items/potion14"
loot give @a[scores={give_item=5}] loot "give_items/splash_potion31"
loot give @a[scores={give_item=6}] loot "give_items/wither_rose"
loot give @a[scores={give_item=7}] loot "give_items/shield"
loot give @a[scores={give_item=8}] loot "give_items/skull"
loot give @a[scores={give_item=9}] loot "give_items/totem_of_undying"
loot give @a[scores={give_item=10}] loot "give_items/hopper"
loot give @a[scores={give_item=11}] loot "give_items/golden_sword"
# 人狼専用
loot give @a[scores={give_item=-1}] loot "give_items/beacon"
loot give @a[scores={give_item=-1}] loot "give_items/beacon"
loot give @a[scores={give_item=-1}] loot "give_items/beacon"
loot give @a[scores={give_item=-1}] loot "give_items/beacon"
loot give @a[scores={give_item=-1}] loot "give_items/beacon"


tag @a remove give_item
scoreboard objectives remove give_item
scoreboard objectives add give_item dummy