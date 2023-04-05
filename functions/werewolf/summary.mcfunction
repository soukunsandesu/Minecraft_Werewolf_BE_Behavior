tag @s add summary
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

execute if entity @a[scores={lover=1}] run tellraw @s {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=1}]"},{"text":"ペア"}]}
execute if entity @a[scores={lover=2}] run tellraw @s {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=2}]"},{"text":"ペア"}]}
execute if entity @a[scores={lover=3}] run tellraw @s {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=3}]"},{"text":"ペア"}]}
execute if entity @a[scores={lover=4}] run tellraw @s {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=4}]"},{"text":"ペア"}]}
execute if entity @a[scores={lover=5}] run tellraw @s {"rawtext":[{"text":"§d恋人§r"},{"selector":"@a[scores={lover=5}]"},{"text":"ペア"}]}

tellraw @s {"rawtext":[{"text":"§a村人§r:"},{"selector":"@a[scores={CurrentRole=5}]"}]}
tellraw @s {"rawtext":[{"text":"§3##############################"}]}




tag @s remove summary
