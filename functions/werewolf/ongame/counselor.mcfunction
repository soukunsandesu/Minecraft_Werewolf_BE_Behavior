# formから
# 村人に変更
scoreboard players set @s[scores={team=1..2}] CurrentRole 5
scoreboard players set @s[scores={team=1..2}] PreviewRole 5
execute as @s[scores={team=1}] run scoreboard players remove MWSystem NumOfWolf 1
execute as @s[scores={team=1..2,lover=0}] run scoreboard players add MWSystem NumOfVillagers 1


# 狂人に変更
scoreboard players set @s[scores={team=3}] CurrentRole 2
scoreboard players set @s[scores={team=3}] PreviewRole 2
execute as @s[scores={team=3,lover=0}] run scoreboard players remove MWSystem NumOfVillagers 1

scoreboard players set @s[scores={CurrentRole=2}] team 2
scoreboard players set @s[scores={CurrentRole=5}] team 3
tellraw @s[scores={CurrentRole=2}] {"rawtext":[{"text":"カウンセリングを受けてあなたは§7狂人§rに変化しました"}]}
tellraw @s[scores={CurrentRole=3}] {"rawtext":[{"text":"カウンセリングを受けてあなたは§a村人§rに変化しました"}]}