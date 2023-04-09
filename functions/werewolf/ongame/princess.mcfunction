# queenから起動
tag @a remove dead_queen
scoreboard players set @s CurrentRole 15
scoreboard players set @s PreviewRole 15
tellraw @a[scores={team=3,a_live=1}] {"rawtext":[{"selector":"@s"},{"text":"が新たな§d女王§rとなった"}]}
tellraw @a[m=!a] {"rawtext":[{"selector":"@s"},{"text":"が新たな§d女王§rとなった"}]}