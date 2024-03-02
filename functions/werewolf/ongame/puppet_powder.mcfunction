# item
# 狂人に変更
scoreboard players set @s[scores={team=3}] CurrentRole 2
scoreboard players set @s[scores={team=3}] PreviewRole 2
execute as @s[scores={team=3,lover=0}] run scoreboard players remove MWSystem NumOfVillagers 1
tellraw @s[scores={CurrentRole=2}] {"rawtext":[{"text":"傀儡の粉を取り込み、あなたは§7狂人§rに変化しました"}]}