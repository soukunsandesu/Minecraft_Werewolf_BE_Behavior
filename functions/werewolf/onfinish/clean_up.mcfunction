execute as @a run function werewolf/summary

gamemode adventure @a[scores={CurrentRole=1..},tag=!Debugger]
clear @a[scores={CurrentRole=1..},tag=!Debugger]
effect @a[scores={CurrentRole=1..},tag=!Debugger] clear
kill @e[type=item]

function werewolf/onfinish/reset

