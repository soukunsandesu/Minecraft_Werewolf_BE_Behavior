scoreboard players add @a elevator 0
# ※asのみで指定するとクラッシュします

execute as @a at @s[scores={elevator=..0}] if block ~~-2~ lodestone if block ~~4~ lodestone run tag @s add Eup
execute as @a at @s[tag=sneaking,scores={elevator=..0}] if block ~~-1~ lodestone if block ~~-7~ lodestone run tag @s add Edown
# execute as @a at @s[tag=jumping] if block ~~-1~ lodestone if block ~~5~ lodestone run tp @s ~~5.25~ true
execute as @a at @s[tag=Eup] run tp @s ~~5~ true
execute as @a at @s[tag=Edown] run tp @s ~~-6~ true

scoreboard players set @a[tag=Eup] elevator 30
scoreboard players set @a[tag=Edown] elevator 30
tag @a remove Eup
tag @a remove Edown
scoreboard players remove @a[scores={elevator=1..}] elevator 1

execute as @a at @s[m=a] run spawnpoint @s ~~~
tag @a add dead
tag @e[type=player] remove dead
tag @a[tag=dead] add spc
gamemode spectator @e[type=player,m=a,tag=spc]
tag @e[type=player] remove spc

tag @a[m=spectator] add spectator
tag @a[m=!spectator] remove spectator

function werewolf/skull
scoreboard players remove @a[scores={poison=1..}] poison 1
effect @a[scores={poison=..0}] wither 120 0
scoreboard players reset @a[scores={poison=..0}] poison

tag @a remove PoisonInjection
tag @a[hasitem={item=wither_rose,location=slot.weapon.mainhand}] add PoisonInjection
effect @a[tag=PoisonInjection] weakness 1 10 true

execute as @a at @s[hasitem={item=beacon},m=a] run function werewolf/mine

