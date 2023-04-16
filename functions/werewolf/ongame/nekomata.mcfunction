# dead_runから起動
tag @r[scores={a_live=1}]  add dead_cat
kill @a[tag=dead_cat]
tellraw @a[tag=dead_cat] {"rawtext":[{"text":"猫又(§g"},{"selector":"@s"},{"text": "§r)による道連れに巻き込まれた。"}]}
tag @a remove dead_cat