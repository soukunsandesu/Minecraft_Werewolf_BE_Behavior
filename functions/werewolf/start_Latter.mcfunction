function werewolf/onstart/js_select_roles
execute as @p[tag=Debugger] run tellraw @a {"rawtext":[{"text":"デバッガー:"},{"selector":"@a[tag=Debugger]"}]}
effect @a[tag=player] regeneration 10 10
effect @a[tag=player] saturation 100 100
give @a[tag=player,tag=!Debugger] diamond 1 0 {"item_lock":{"mode":"lock_in_inventory"}}


replaceitem entity @a[tag=player] slot.inventory 18 quartz 1 0 {"minecraft:item_lock":{"mode":"lock_in_slot"}}
replaceitem entity @a[tag=player] slot.inventory 19 quartz 1 0 {"minecraft:item_lock":{"mode":"lock_in_slot"}}
replaceitem entity @a[tag=player] slot.inventory 20 quartz 1 0 {"minecraft:item_lock":{"mode":"lock_in_slot"}}

tag @a remove player