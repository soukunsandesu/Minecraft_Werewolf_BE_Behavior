execute as @a run function werewolf/onstart/INplayer_each
scoreboard players add @a INplayer 0
scoreboard players set in_pl INplayer 0
scoreboard players set all_pl INplayer 0
execute as @a[tag=player] run scoreboard players add in_pl INplayer 1
execute as @a run scoreboard players add all_pl INplayer 1
titleraw @a[tag=player,scores={INplayer=0}] actionbar {"rawtext":[{"text":"§a参加中§r\n"},{"score":{"name":"in_pl","objective":"INplayer"}},{"text":"/"},{"score":{"name":"all_pl","objective":"INplayer"}},{"text":"人"}]}
titleraw @a[tag=!player,scores={INplayer=0}] actionbar {"rawtext":[{"text":"§c待機中§r\n"},{"score":{"name":"in_pl","objective":"INplayer"}},{"text":"/"},{"score":{"name":"all_pl","objective":"INplayer"}},{"text":"人"}]}