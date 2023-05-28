scoreboard players add @a Ongame 0
gamemode spectator @a[scores={Ongame=0}]
tellraw @a[scores={Ongame=0}] {"rawtext":[{"text":"人狼ビヘイビアパックが有効です\nこのビヘイビアパックは導入されたワールドで人狼ができるようにするものです\nop権限があるプレイヤーが棒を使用することでゲーム設定が開きます\nまた、「.name<名前>」で名前を変更できます"}]}
scoreboard players set @a Ongame 1

scoreboard players add @a elevator 0

execute as @a[scores={CurrentRole=0}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"観戦 / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=1}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §4人狼§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=2}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §5狂人§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=3}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §b預言者§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=4}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §e霊媒師§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=5}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §a村人§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=6}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §b怪盗§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=7}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §g猫又§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=8}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §e狐§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=9}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §7狂信者§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=10}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §4大狼§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=11}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §4賢狼§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=12}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §6パン屋§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=13}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §7囁く狂人§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=14}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §a村人§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=15}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §d女王§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=16}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §dプリンセス§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=17}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §a狩人§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}
execute as @a[scores={PreviewRole=18}] if score MWSystem time matches 0.. run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §7ボマー§r / "},{"text":"クォーツ全配布まで残り"},{"score":{"name":"MWSystem","objective":"time"}},{"text":"秒"}]}

execute as @a[scores={PreviewRole=1}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §4人狼§r"}]}
execute as @a[scores={PreviewRole=2}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §5狂人§r"}]}
execute as @a[scores={PreviewRole=3}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §b預言者§r"}]}
execute as @a[scores={PreviewRole=4}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §e霊媒師§r"}]}
execute as @a[scores={PreviewRole=5}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §a村人§r"}]}
execute as @a[scores={PreviewRole=6}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §b怪盗§r"}]}
execute as @a[scores={PreviewRole=7}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §g猫又§r"}]}
execute as @a[scores={PreviewRole=8}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §e狐§r"}]}
execute as @a[scores={PreviewRole=9}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §7狂信者§r"}]}
execute as @a[scores={PreviewRole=10}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §4大狼§r"}]}
execute as @a[scores={PreviewRole=11}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §4賢狼§r"}]}
execute as @a[scores={PreviewRole=12}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §6パン屋§r"}]}
execute as @a[scores={PreviewRole=13}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §7囁く狂人§r"}]}
execute as @a[scores={PreviewRole=14}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §a村人§r"}]}
execute as @a[scores={PreviewRole=15}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §d女王§r"}]}
execute as @a[scores={PreviewRole=16}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §dプリンセス§r"}]}
execute as @a[scores={PreviewRole=17}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §a狩人§r"}]}
execute as @a[scores={PreviewRole=18}] if score MWSystem time matches ..-1 run titleraw @s actionbar {"rawtext":[{"text":"あなたの役職: §7ボマー§r"}]}


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

# 死亡判定
execute as @e[type=player,m=a] at @s run spawnpoint @s ~~~
tag @a[m=a] add dead
tag @e[type=player] remove dead
tag @a[tag=dead] add dead_t
execute as @e[type=player,tag=dead_t,scores={a_live=1..}] run function werewolf/ongame/dead
tag @e[type=player] remove dead_t
kill @e[tag=kill,type=player]

# スペクテイターチャット用
tag @a[m=spectator] add spectator
tag @a[m=!spectator] remove spectator
tag @a remove a_live
tag @a[scores={a_live=1..}] add a_live

function werewolf/items/skull
scoreboard players remove @a[scores={poison=1..}] poison 1
effect @a[scores={poison=..0}] wither 120 0
scoreboard players reset @a[scores={poison=..0}] poison

tag @a remove PoisonInjection
tag @a[hasitem={item=wither_rose,location=slot.weapon.mainhand}] add PoisonInjection
effect @a[tag=PoisonInjection] weakness 1 10 true
tag @a remove ruin
tag @a[hasitem={item=golden_sword,location=slot.weapon.mainhand}] add ruin
tag @a remove C4bomb
tag @a[hasitem={item=respawn_anchor,location=slot.weapon.mainhand}] add C4bomb
effect @a[tag=C4bomb] weakness 1 10 true

execute as @a[scores={team=3..4},hasitem={item=beacon},m=a] at @s run function werewolf/items/mine
execute as @a[scores={team=1..4},hasitem={item=respawn_anchor},m=a] at @s run function werewolf/items/C4bomb


execute as @a[hasitem={item=quartz_block},m=a] run function werewolf/items/quartz_give

execute as @p[tag=Debugger] run function werewolf/onfinish/tick_debug
# 勝利判定
execute if score MWSystem NumOfWolf matches 0 as @p[scores={CurrentRole=1..}] run function werewolf/onfinish/winner/check
execute if score MWSystem NumOfVillagers matches 0 as @p[scores={CurrentRole=1..}] run function werewolf/onfinish/winner/check