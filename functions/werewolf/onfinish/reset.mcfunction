scoreboard objectives remove NumOfPlayers
scoreboard objectives remove CurrentRole
scoreboard objectives remove PreviewRole
scoreboard objectives remove NumOfWolf
scoreboard objectives remove NumOfVillagers
scoreboard objectives remove NumOfFox
scoreboard objectives remove elevator
scoreboard objectives remove poison
scoreboard objectives remove skull
scoreboard objectives remove time
scoreboard objectives remove a_live
scoreboard objectives remove StartRoll
scoreboard objectives remove team

scoreboard objectives add INplayer dummy
scoreboard players add @a INplayer 0
give @a[tag=OP] blaze_rod
give @a[tag=!OP,tag=admin] blaze_rod
give @a[tag=!OP,tag=!admin,tag=Debugger] blaze_rod