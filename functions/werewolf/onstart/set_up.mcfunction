function werewolf/onfinish/reset
scoreboard objectives remove INplayer
gamerule showdeathmessages false
gamerule sendcommandfeedback false
gamerule keepinventory false

scoreboard objectives add elevator dummy
scoreboard objectives add poison dummy
scoreboard objectives add skull dummy
scoreboard objectives add time dummy
scoreboard players set score150 time 150
scoreboard players set score2 time 2
scoreboard objectives add Previewteam dummy

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
scoreboard objectives add NumOfFox dummy
scoreboard objectives add NumOfLover dummy

scoreboard objectives add StartRoll dummy

# ゲーム中に参加してきたプレイヤー用
scoreboard objectives remove Ongame
scoreboard objectives add Ongame dummy
scoreboard players set @a Ongame 1

scoreboard objectives add team dummy
scoreboard objectives add WolfC dummy
scoreboard objectives add Wquartz dummy

scoreboard objectives add lover dummy
