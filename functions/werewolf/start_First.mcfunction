function werewolf/onstart/set_up
gamemode adventure @a[tag=player]
clear @a[tag=player,tag=!Debugger]
effect @a[tag=player,tag=!Debugger] clear
kill @e[type=item]
give @a[tag=player,tag=!Debugger] diamond 1 0 {"item_lock":{"mode":"lock_in_inventory"}}
function werewolf/onstart/give_items
execute as @p[tag=Debugger] run function werewolf/onstart/debug
scoreboard players set @a[tag=player] CurrentRole 0
