function werewolf/onstart/js_select_roles
execute as @p[tag=Debugger] run tellraw @a {"rawtext":[{"text":"デバッガー:"},{"selector":"@a[tag=Debugger]"}]}
effect @a[tag=player] regeneration 10 10
effect @a[tag=player] saturation 100 100
tag @a remove player