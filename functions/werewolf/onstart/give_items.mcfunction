scoreboard objectives add give_item dummy
scoreboard players set @a[tag=player] give_item 0
scoreboard players set @r[scores={give_item=0}] give_item 1
scoreboard players set @r[scores={give_item=0}] give_item 2
scoreboard players set @r[scores={give_item=0}] give_item 3
scoreboard players set @r[scores={give_item=0}] give_item 4
scoreboard players set @r[scores={give_item=0}] give_item 5
scoreboard players set @r[scores={give_item=0}] give_item 6
scoreboard players set @r[scores={give_item=0}] give_item 7
scoreboard players set @r[scores={give_item=0}] give_item 8
scoreboard players set @r[scores={give_item=0}] give_item 9
scoreboard players set @r[scores={give_item=0}] give_item 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
scoreboard players random @r[scores={give_item=0}] give_item 1 10
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
loot give @a[scores={give_item=10}] loot "give_items/golden_sword"
# アイテム未定
loot give @a[scores={give_item=-1}] loot "give_items/beacon"
loot give @a[scores={give_item=-1}] loot "give_items/beacon"
loot give @a[scores={give_item=-1}] loot "give_items/beacon"
loot give @a[scores={give_item=-1}] loot "give_items/beacon"
loot give @a[scores={give_item=-1}] loot "give_items/beacon"


scoreboard objectives remove give_item
scoreboard objectives add give_item dummy