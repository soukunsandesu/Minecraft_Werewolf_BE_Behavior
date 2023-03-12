scoreboard players add @a elevator 0

execute as @a[scores={CurrentRole=0}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"観戦 / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=1}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §4人狼§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=2}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §5狂人§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=3}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §b預言者§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=4}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §e霊媒師§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=5}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §a村人§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=6}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §b怪盗§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=7}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §g猫又§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}

execute as @a[scores={PreviewRole=1}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §4人狼§r"}]}
execute as @a[scores={PreviewRole=2}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §5狂人§r"}]}
execute as @a[scores={PreviewRole=3}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §b預言者§r"}]}
execute as @a[scores={PreviewRole=4}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §e霊媒師§r"}]}
execute as @a[scores={PreviewRole=5}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §a村人§r"}]}
execute as @a[scores={PreviewRole=6}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §b怪盗§r"}]}
execute as @a[scores={PreviewRole=7}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §g猫又§r"}]}

execute as @p[scores={INplayer=-100..100}] run function werewolf/onstart/INplayer


execute as @a[scores={elevator=..0}] at @s if block ~~-2~ lodestone if block ~~4~ lodestone run tag @s add Eup
execute as @a[tag=sneaking,scores={elevator=..0}] at @s if block ~~-1~ lodestone if block ~~-7~ lodestone run tag @s add Edown
# execute as @a at @s[tag=jumping] if block ~~-1~ lodestone if block ~~5~ lodestone run tp @s ~~5.25~ true
execute as @a[tag=Eup] at @s run tp @s ~~5~ true
execute as @a[tag=Edown] at @s run tp @s ~~-6~ true

scoreboard players set @a[tag=Eup] elevator 30
scoreboard players set @a[tag=Edown] elevator 30
tag @a remove Eup
tag @a remove Edown
scoreboard players remove @a[scores={elevator=1..}] elevator 1
execute as @e[type=player,m=a] at @s run spawnpoint @s ~~~

# 死亡判定
tag @a add dead
tag @e[type=player] remove dead
tag @a[tag=dead] add dead_t
execute as @e[type=player,tag=dead_t,scores={CurrentRole=1..}] run function werewolf/dead

# スペクテイターチャット用
tag @a[m=spectator] add spectator
tag @a[m=!spectator] remove spectator
kill @e[type=item,name=ダイヤモンド]

function werewolf/skull
scoreboard players remove @a[scores={poison=1..}] poison 1
effect @a[scores={poison=..0}] wither 120 0
scoreboard players reset @a[scores={poison=..0}] poison

tag @a remove PoisonInjection
tag @a[hasitem={item=wither_rose,location=slot.weapon.mainhand}] add PoisonInjection
effect @a[tag=PoisonInjection] weakness 1 10 true
tag @a remove ruin
tag @a[hasitem={item=golden_sword,location=slot.weapon.mainhand}] add ruin

execute as @a[scores={CurrentRole=3..},hasitem={item=beacon},m=a] at @s run function werewolf/mine


execute as @a[hasitem={item=quartz_block},m=a] run function werewolf/quartz_give

execute as @p[tag=Debugger] run function werewolf/tick_debug
# 勝利判定
execute as @p[scores={CurrentRole=1..}] run function werewolf/onfinish/winner/check