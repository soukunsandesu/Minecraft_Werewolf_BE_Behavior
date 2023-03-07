# ※asのみで指定するとクラッシュします
execute as @a at @s[tag=sneaking,tag=!sneak] if block ~~-1~ lodestone if block ~~-7~ lodestone run tp @s ~~-6~ true
# execute as @a at @s[tag=jumping] if block ~~-1~ lodestone if block ~~5~ lodestone run tp @s ~~5.25~ true
execute as @a at @s if block ~~-2~ lodestone if block ~~4~ lodestone run tp @s ~~5~ true
tag @a[tag=sneaking] add sneak
tag @a[tag=!sneaking] remove sneak