tag @a[hasitem={item=skull,location=slot.armor.head}] add skull
scoreboard players set @a[tag=skull] skull 20
scoreboard players remove @a[tag=!skull,scores={skull=1..}] skull 1
replaceitem entity @a[tag=skull,tag=!skull_T] slot.armor.chest 0 leather_chestplate 1 0 {"item_lock":{"mode":"lock_in_slot"}}
replaceitem entity @a[tag=skull,tag=!skull_T] slot.armor.legs 0 leather_leggings 1 0 {"item_lock":{"mode":"lock_in_slot"}}
replaceitem entity @a[tag=skull,tag=!skull_T] slot.armor.feet 0 leather_boots 1 0 {"item_lock":{"mode":"lock_in_slot"}}
clear @a[tag=!skull,scores={skull=0}] leather_chestplate
clear @a[tag=!skull,scores={skull=0}] leather_leggings
clear @a[tag=!skull,scores={skull=0}] leather_boots
effect @a[tag=skull] invisibility 1 1 true
tag @a[tag=skull] add skull_T
tag @a[tag=!skull] remove skull_T
tag @a remove skull