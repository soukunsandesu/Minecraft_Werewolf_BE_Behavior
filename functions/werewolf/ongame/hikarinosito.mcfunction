# js_select_rolesから起動
scoreboard players random @s StartRoll 1 6

# 予言
scoreboard players set @s[scores={StartRoll=1}] CurrentRole 3
# 霊媒
scoreboard players set @s[scores={StartRoll=2}] CurrentRole 4
# 村人
scoreboard players set @s[scores={StartRoll=3}] CurrentRole 5
# 猫又
scoreboard players set @s[scores={StartRoll=4}] CurrentRole 7
# パン屋
scoreboard players set @s[scores={StartRoll=5}] CurrentRole 12
# 狩人
scoreboard players set @s[scores={StartRoll=6}] CurrentRole 17

scoreboard players operation @s PreviewRole = @s CurrentRole
scoreboard players set @s StartRoll 19

tag @s add No_tell
tellraw @s {"rawtext":[{"text":"あなたの役職は§e光の使徒§rです"}]}

tellraw @s[scores={CurrentRole=3}] {"rawtext":[{"text":"§b預言者§rに変化しました"}]}
tellraw @s[scores={CurrentRole=4}] {"rawtext":[{"text":"§e霊媒師§rに変化しました"}]}
tellraw @s[scores={CurrentRole=5}] {"rawtext":[{"text":"§a村人§rに変化しました"}]}
tellraw @s[scores={CurrentRole=7}] {"rawtext":[{"text":"§g猫又§rに変化しました"}]}
tellraw @s[scores={CurrentRole=12}] {"rawtext":[{"text":"§6パン屋§rに変化しました"}]}
tellraw @s[scores={CurrentRole=17}] {"rawtext":[{"text":"§a狩人§rに変化しました"}]}