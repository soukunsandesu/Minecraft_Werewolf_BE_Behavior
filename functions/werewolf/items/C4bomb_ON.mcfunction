damage @a[r=2] 30 block_explosion
damage @a[r=5] 20 block_explosion
particle minecraft:huge_explosion_emitter ~~~
playsound random.explode @a ~~~ 50 1 100
kill @s[type=item]
scoreboard players reset @a C4bomb