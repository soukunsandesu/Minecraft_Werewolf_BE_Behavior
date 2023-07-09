# js_select_rolesから起動
scoreboard players random @s StartRoll 1 6

# 人狼
scoreboard players set @s[scores={StartRoll=1}] CurrentRole 1
# 狂人
scoreboard players set @s[scores={StartRoll=2}] CurrentRole 2
# 狂信者
scoreboard players set @s[scores={StartRoll=3}] CurrentRole 9
# 大狼
scoreboard players set @s[scores={StartRoll=4}] CurrentRole 10
# 賢狼
scoreboard players set @s[scores={StartRoll=5}] CurrentRole 11
# 囁く狂人
scoreboard players set @s[scores={StartRoll=6}] CurrentRole 13

scoreboard players operation @s PreviewRole = @s CurrentRole
scoreboard players set @s StartRoll 20
function werewolf/onstart/roles_count
tag @s add No_tell
tellraw @s {"rawtext":[{"text":"あなたの役職は§7闇の化身§rです"}]}

tellraw @s[scores={CurrentRole=1}] {"rawtext":[{"text":"§4人狼§rに変化しました"}]}
tellraw @s[scores={CurrentRole=2}] {"rawtext":[{"text":"§5狂人§rに変化しました"}]}
tellraw @s[scores={CurrentRole=9}] {"rawtext":[{"text":"§7狂信者§rに変化しました"}]}
tellraw @s[scores={CurrentRole=10}] {"rawtext":[{"text":"§4大狼§rに変化しました"}]}
tellraw @s[scores={CurrentRole=11}] {"rawtext":[{"text":"§4賢狼§rに変化しました"}]}
tellraw @s[scores={CurrentRole=13}] {"rawtext":[{"text":"§7囁く狂人§rに変化しました"}]}