scoreboard players add @s[tag=sneaking,tag=!player,scores={INplayer=-50..50}] INplayer 1
scoreboard players remove @s[tag=sneaking,tag=player,scores={INplayer=-50..50}] INplayer 1
titleraw @s[scores={INplayer=1..2}] actionbar {"rawtext":[{"text":"§c××××××××××"}]}
titleraw @s[scores={INplayer=3..4}] actionbar {"rawtext":[{"text":"§a×§c×××××××××"}]}
titleraw @s[scores={INplayer=5..6}] actionbar {"rawtext":[{"text":"§a××§c××××××××"}]}
titleraw @s[scores={INplayer=7..8}] actionbar {"rawtext":[{"text":"§a×××§c×××××××"}]}
titleraw @s[scores={INplayer=9..10}] actionbar {"rawtext":[{"text":"§a××××§c××××××"}]}
titleraw @s[scores={INplayer=11..12}] actionbar {"rawtext":[{"text":"§a×××××§c×××××"}]}
titleraw @s[scores={INplayer=13..14}] actionbar {"rawtext":[{"text":"§a××××××§c××××"}]}
titleraw @s[scores={INplayer=15..16}] actionbar {"rawtext":[{"text":"§a×××××××§c×××"}]}
titleraw @s[scores={INplayer=17..18}] actionbar {"rawtext":[{"text":"§a××××××××§c××"}]}
titleraw @s[scores={INplayer=19..20}] actionbar {"rawtext":[{"text":"§a×××××××××§c×"}]}
titleraw @s[scores={INplayer=21..}] actionbar {"rawtext":[{"text":"§a××××××××××"}]}

titleraw @s[scores={INplayer=..-21}] actionbar {"rawtext":[{"text":"§c××××××××××"}]}
titleraw @s[scores={INplayer=-20..-19}] actionbar {"rawtext":[{"text":"§a×§c×××××××××"}]}
titleraw @s[scores={INplayer=-18..-17}] actionbar {"rawtext":[{"text":"§a××§c××××××××"}]}
titleraw @s[scores={INplayer=-16..-15}] actionbar {"rawtext":[{"text":"§a×××§c×××××××"}]}
titleraw @s[scores={INplayer=-14..-13}] actionbar {"rawtext":[{"text":"§a××××§c××××××"}]}
titleraw @s[scores={INplayer=-12..-11}] actionbar {"rawtext":[{"text":"§a×××××§c×××××"}]}
titleraw @s[scores={INplayer=-10..-9}] actionbar {"rawtext":[{"text":"§a××××××§c××××"}]}
titleraw @s[scores={INplayer=-8..-7}] actionbar {"rawtext":[{"text":"§a×××××××§c×××"}]}
titleraw @s[scores={INplayer=-6..-5}] actionbar {"rawtext":[{"text":"§a××××××××§c××"}]}
titleraw @s[scores={INplayer=-4..-3}] actionbar {"rawtext":[{"text":"§a×××××××××§c×"}]}
titleraw @s[scores={INplayer=-2..-1}] actionbar {"rawtext":[{"text":"§a××××××××××"}]}
tag @s[tag=!sneaking,scores={INplayer=21..}] add player
tag @s[tag=!sneaking,scores={INplayer=..-21}] remove player

scoreboard players set @s[tag=!sneaking] INplayer 0