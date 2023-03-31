function werewolf/onstart/js_select_roles
execute as @p[tag=Debugger] run tellraw @a {"rawtext":[{"text":"デバッガー:"},{"selector":"@a[tag=Debugger]"}]}
effect @a[tag=player] regeneration 10 10
effect @a[tag=player] saturation 100 100
give @a[tag=player,tag=!Debugger] diamond 1 0 {"item_lock":{"mode":"lock_in_inventory"}}


replaceitem entity @a slot.inventory 18 barrier 1 0 {"minecraft:item_lock":{"mode":"lock_in_slot"}}
replaceitem entity @a slot.inventory 19 barrier 1 0 {"minecraft:item_lock":{"mode":"lock_in_slot"}}
replaceitem entity @a slot.inventory 20 barrier 1 0 {"minecraft:item_lock":{"mode":"lock_in_slot"}}

tag @a remove player