# 20tickから
give @s quartz

# 人狼のみ配布
scoreboard players add @s[scores={Previewteam=1}] Wquartz 1
replaceitem entity @s[scores={Wquartz=1}] slot.inventory 18 quartz
replaceitem entity @s[scores={Wquartz=2}] slot.inventory 19 quartz
replaceitem entity @s[scores={Wquartz=3}] slot.inventory 20 quartz
replaceitem entity @s[scores={Wquartz=4}] slot.inventory 21 quartz
