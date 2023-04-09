# 20tickから起動
tellraw @s {"rawtext":[{"text":"§7指定時間が経過したので役職が市民に変更されました"}]}
scoreboard players set @s CurrentRole 5
scoreboard players set @s PreviewRole 5
clear @s diamond