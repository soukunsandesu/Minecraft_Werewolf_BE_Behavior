execute as @a run function werewolf/summary
gamemode adventure @a[tag=!Debugger]
clear @a[scores={CurrentRole=1..},tag=!Debugger]
effect @a[scores={CurrentRole=1..},tag=!Debugger] clear
kill @e[type=snow_golem,name=portal]
kill @e[type=item]
kill @e[type=arrow]
function werewolf/onfinish/reset