scoreboard players set @e[type=armor_stand,name=人狼] CurrentRole 1
scoreboard players set @e[type=armor_stand,name=狂人] CurrentRole 2
scoreboard players set @e[type=armor_stand,name=預言者] CurrentRole 3
scoreboard players set @e[type=armor_stand,name=霊媒師] CurrentRole 4
scoreboard players set @e[type=armor_stand,name=村人] CurrentRole 5


execute as @e[type=armor_stand] run scoreboard players operation @s PreviewRole = @s CurrentRole
scoreboard players set @e[type=armor_stand,scores={CurrentRole=1..}] a_live 1

execute as @e[type=armor_stand,scores={CurrentRole=1}] run scoreboard players add MWSystem NumOfWolf 1
execute as @e[type=armor_stand,scores={CurrentRole=3..5}] run scoreboard players add MWSystem NumOfVillagers 1