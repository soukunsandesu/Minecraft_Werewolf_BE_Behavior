tag @s add summary
tellraw @s {"rawtext":[{"text":"§3##############################"}]}
execute if score 人狼 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§4人狼§r:"},{"selector":"@e[scores={CurrentRole=1}]"}]}
execute if score 狂人 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§5狂人§r:"},{"selector":"@e[scores={CurrentRole=2}]"}]}
execute if score 預言者 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§b預言者§r:"},{"selector":"@e[scores={CurrentRole=3}]"}]}
execute if score 霊媒師 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§e霊媒師§r:"},{"selector":"@e[scores={CurrentRole=4}]"}]}
execute if score 怪盗 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§b怪盗§r:"},{"selector":"@e[scores={StartRoll=6}]"}]}
execute if score 猫又 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§g猫又§r:"},{"selector":"@e[scores={StartRoll=7}]"}]}
execute if score 狐 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§e狐§r:"},{"selector":"@e[scores={StartRoll=8}]"}]}
execute if score 狂信者 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§7狂信者§r:"},{"selector":"@e[scores={StartRoll=9}]"}]}
execute if score 大狼 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§4大狼§r:"},{"selector":"@e[scores={StartRoll=10}]"}]}
execute if score 賢狼 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§4賢狼§r:"},{"selector":"@e[scores={StartRoll=11}]"}]}
execute if score パン屋 StartRoll matches 1.. run tellraw @s {"rawtext":[{"text":"§6パン屋§r:"},{"selector":"@e[scores={StartRoll=12}]"}]}


tellraw @s {"rawtext":[{"text":"§a村人§r:"},{"selector":"@e[scores={CurrentRole=5}]"}]}
tellraw @s {"rawtext":[{"text":"§3##############################"}]}




tag @s remove summary
