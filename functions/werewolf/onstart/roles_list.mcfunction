tellraw @a {"rawtext":[{"text":"プレイヤー数: "},{"score":{"name": "MWSystem","objective":"NumOfPlayers"}},{"text":"\n今回の役職"}]}
execute if score 人狼 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§4人狼§r"},{"score":{"name":"人狼","objective":"StartRoll"}}]}
execute if score 狂人 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§5狂人§r"},{"score":{"name":"狂人","objective":"StartRoll"}}]}
execute if score 預言者 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§b預言者§r"},{"score":{"name":"預言者","objective":"StartRoll"}}]}
execute if score 霊媒師 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§e霊媒師§r"},{"score":{"name":"霊媒師","objective":"StartRoll"}}]}
execute if score 村人 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§a村人§r"},{"score":{"name":"村人","objective":"StartRoll"}}]}
execute if score 怪盗 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§b怪盗§r"},{"score":{"name":"怪盗","objective":"StartRoll"}}]}
execute if score 猫又 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§g猫又§r"},{"score":{"name":"猫又","objective":"StartRoll"}}]}
execute if score 狐 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§e狐§r"},{"score":{"name":"狐","objective":"StartRoll"}}]}
execute if score 狂信者 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§7狂信者§r"},{"score":{"name":"狂信者","objective":"StartRoll"}}]}
execute if score 大狼 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§4大狼§r"},{"score":{"name":"大狼","objective":"StartRoll"}}]}
execute if score 賢狼 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§4賢狼§r"},{"score":{"name":"賢狼","objective":"StartRoll"}}]}
execute if score パン屋 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§6パン屋§r"},{"score":{"name":"パン屋","objective":"StartRoll"}}]}
execute if score 囁く狂人 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§7囁く狂人§r"},{"score":{"name":"囁く狂人","objective":"StartRoll"}}]}
execute if score 狼付き StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§4狼付き§r"},{"score":{"name":"狼付き","objective":"StartRoll"}}]}
execute if score 女王 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§d女王§r"},{"score":{"name":"女王","objective":"StartRoll"}}]}
execute if score プリンセス StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§dプリンセス§r"},{"score":{"name":"プリンセス","objective":"StartRoll"}}]}
execute if score 狩人 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§a狩人§r"},{"score":{"name":"狩人","objective":"StartRoll"}}]}
execute if score ボマー StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§7ボマー§r"},{"score":{"name":"ボマー","objective":"StartRoll"}}]}

execute if score 恋人 StartRoll matches 1.. run tellraw @a {"rawtext":[{"text":"§d恋人§r"},{"score":{"name":"恋人","objective":"StartRoll"}},{"text":"組"}]}