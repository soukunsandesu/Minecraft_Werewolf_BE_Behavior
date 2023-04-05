function werewolf/onstart/js_select_roles
execute as @p[tag=Debugger] run tellraw @a {"rawtext":[{"text":"デバッガー:"},{"selector":"@a[tag=Debugger]"}]}
effect @a[tag=player] regeneration 10 10
effect @a[tag=player] saturation 100 100
give @a[tag=player,tag=!Debugger] diamond 1 0 {"item_lock":{"mode":"lock_in_inventory"}}
loot give @a[tag=player] loot "give_items/stick_chat"
loot give @a[scores={WolfC=1}] loot "give_items/stick_wolf"
loot give @a loot "give_items/stick_help"


replaceitem entity @a[tag=player] slot.inventory 18 barrier 1 0 {"minecraft:item_lock":{"mode":"lock_in_slot"}}
replaceitem entity @a[tag=player] slot.inventory 19 barrier 1 0 {"minecraft:item_lock":{"mode":"lock_in_slot"}}
replaceitem entity @a[tag=player] slot.inventory 20 barrier 1 0 {"minecraft:item_lock":{"mode":"lock_in_slot"}}

tag @a remove player