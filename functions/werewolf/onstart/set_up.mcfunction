function werewolf/onfinish/reset
scoreboard objectives remove INplayer
gamerule showdeathmessages false
gamerule sendcommandfeedback false
gamerule keepinventory false

scoreboard objectives add elevator dummy
scoreboard objectives add poison dummy
scoreboard objectives add skull dummy
scoreboard objectives add time dummy
scoreboard players set MWSystem time 600
# 生者 1 死者 0
scoreboard objectives add a_live dummy
scoreboard players set @a[tag=player] a_live 1
scoreboard objectives add PreviewRole dummy
scoreboard objectives add CurrentRole dummy
# execute as @a run scoreboard players set @s CurrentRole 0

# プレイヤー数カウント
scoreboard objectives add NumOfPlayers dummy
# 役職生存数カウント
scoreboard objectives add NumOfWolf dummy
scoreboard objectives add NumOfVillagers dummy
scoreboard objectives add StartRoll dummy

