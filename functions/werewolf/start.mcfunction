# ロビーのダイヤブロック内の人を参加者とする
tag @a[x=-4,y=0,z=-31,dx=8,dy=8,dz=8] add player
function werewolf/onstart/set_up
gamemode adventure @a[tag=player]
clear @a[tag=player,tag=!Debugger]
effect @a[tag=player,tag=!Debugger] clear
kill @e[type=item]
give @a[tag=player,tag=!Debugger] diamond 1 0 {"item_lock":{"mode":"lock_in_inventory"}}
function werewolf/onstart/give_items
execute as @p[tag=Debugger] run function werewolf/onstart/debug
function werewolf/onstart/select_roles
execute as @p[tag=Debugger] run tellraw @a {"rawtext":[{"text":"デバッガー:"},{"selector":"@a[tag=Debugger]"}]}
tag @a remove player