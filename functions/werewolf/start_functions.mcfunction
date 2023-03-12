function werewolf/onstart/set_up
gamemode adventure @a[tag=player]
tag @a[tag=player] remove dead_t
clear @a[tag=player,tag=!Debugger]
effect @a[tag=player,tag=!Debugger] clear
kill @e[type=item]
give @a[tag=player,tag=!Debugger] diamond 1 0 {"item_lock":{"mode":"lock_in_inventory"}}
function werewolf/onstart/give_items
execute as @p[tag=Debugger] run function werewolf/onstart/debug
function werewolf/onstart/select_roles
execute as @p[tag=Debugger] run tellraw @a {"rawtext":[{"text":"デバッガー:"},{"selector":"@a[tag=Debugger]"}]}
effect @a[tag=player] regeneration 10 10
effect @a[tag=player] saturation 100 100
tag @a remove player

