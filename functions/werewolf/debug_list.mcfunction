tellraw @s {"rawtext":[{"text":"§3##############################"}]}
execute if score 人狼 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§4人狼§r:"},{"selector":"@a[scores={CurrentRole=1}]"}]}
execute if score 狂人 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§5狂人§r:"},{"selector":"@a[scores={CurrentRole=2}]"}]}
execute if score 預言者 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§b預言者§r:"},{"selector":"@a[scores={CurrentRole=3}]"}]}
execute if score 霊媒師 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§e霊媒師§r:"},{"selector":"@a[scores={CurrentRole=4}]"}]}
execute if score 怪盗 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§b怪盗§r:"},{"selector":"@a[scores={StartRoll=6}]"}]}
execute if score 猫又 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§g猫又§r:"},{"selector":"@a[scores={CurrentRole=7}]"}]}
execute if score 狐 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§e狐§r:"},{"selector":"@a[scores={CurrentRole=8}]"}]}
execute if score 狂信者 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§7狂信者§r:"},{"selector":"@a[scores={CurrentRole=9}]"}]}
execute if score 大狼 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§4大狼§r:"},{"selector":"@a[scores={CurrentRole=10}]"}]}
execute if score 賢狼 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§4賢狼§r:"},{"selector":"@a[scores={CurrentRole=11}]"}]}
execute if score パン屋 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§6パン屋§r:"},{"selector":"@a[scores={CurrentRole=12}]"}]}
execute if score 囁く狂人 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§7囁く狂人§r:"},{"selector":"@a[scores={CurrentRole=13}]"}]}
execute if score 狼付き StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§4狼付き§r:"},{"selector":"@a[scores={CurrentRole=14}]"}]}
execute if score 女王 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§d女王§r:"},{"selector":"@a[scores={CurrentRole=15}]"}]}
execute if score プリンセス StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§dプリンセス§r:"},{"selector":"@a[scores={CurrentRole=16}]"}]}
execute if score 狩人 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§a狩人§r:"},{"selector":"@a[scores={CurrentRole=17}]"}]}
execute if score ボマー StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§7ボマー§r:"},{"selector":"@a[scores={CurrentRole=18}]"}]}
execute if score 光の使徒 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§e光の使徒§r:"},{"selector":"@a[scores={StartRoll=19}]"}]}
execute if score 闇の化身 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§7闇の化身§r:"},{"selector":"@a[scores={StartRoll=20}]"}]}

execute if entity @a[scores={lover=1}] run tellraw @s {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=1}]"},{"text":"ペア"}]}
execute if entity @a[scores={lover=2}] run tellraw @s {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=2}]"},{"text":"ペア"}]}
execute if entity @a[scores={lover=3}] run tellraw @s {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=3}]"},{"text":"ペア"}]}
execute if entity @a[scores={lover=4}] run tellraw @s {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=4}]"},{"text":"ペア"}]}
execute if entity @a[scores={lover=5}] run tellraw @s {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=5}]"},{"text":"ペア"}]}

tellraw @s {"rawtext":[{"text":"§a村人§r:"},{"selector":"@a[scores={CurrentRole=5}]"}]}
tellraw @s {"rawtext":[{"text":"§3##############################"}]}
tellraw @s { "rawtext": [ {"text":"§a村カウント§r:"},{"score":{"name":"MWSystem","objective":"NumOfVillagers" }},{"text":"\n§4人狼カウント§r:"},{"score":{"name":"MWSystem","objective":"NumOfWolf" }},{"text":"\n§c狐カウント§r:"},{"score":{"name":"MWSystem","objective":"NumOfFox" }},{"text":"\n§7ボマーカウント§r:"},{"score":{"name":"MWSystem","objective":"NumOfBomber" }},{"text":"\n§d恋人カウント§r:"},{"score":{"name":"MWSystem","objective":"NumOfLover" }} ]}