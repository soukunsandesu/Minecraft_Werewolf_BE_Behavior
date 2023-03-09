tag @a[x=-4,y=0,z=-31,dx=8,dy=8,dz=8] add player
function werewolf/onstart/set_up
gamemode adventure @a[tag=player]
clear @a
effect @a[tag=!Debugger] clear
kill @e[type=item]
give @a diamond 1 0 {"item_lock":{"mode":"lock_in_inventory"}}
function werewolf/onstart/give_items
function werewolf/onstart/select_roles
execute as @p[tag=Debugger] run function werewolf/onstart/debug
tag @a remove player