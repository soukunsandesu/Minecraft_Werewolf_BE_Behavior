function werewolf/onstart/set_up
gamemode adventure @a[tag=player]
gamemode spectator @a[tag=!player,tag=!Debugger]
clear @a[tag=player,tag=!Debugger]
effect @a[tag=player,tag=!Debugger] clear
kill @e[type=item]
function werewolf/onstart/give_items
execute as @p[tag=Debugger] run function werewolf/onstart/debug
scoreboard players set @a[tag=player] CurrentRole 0
