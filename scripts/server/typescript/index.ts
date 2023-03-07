import { Player, world } from "@minecraft/server"

export enum Role
{
    Werewolf = "人狼",
    Madman = "狂人",
    FortuneTeller = "占い師",
    Medium = "霊媒師",
    Villager = "村人"
}
export class Werewolf
{
    readonly name: Role = Role.Werewolf;
    players: Player[];

    getPlayersFromScoreboard()
    {
        for (var player of world.getPlayers())
        {
            var scoreboard = player.scoreboard;
            if (!this.players.includes(player) && scoreboard.displayName == "test" && scoreboard.id == 1)
                this.players.push(player)
        }
    }

    addPlayer(player: Player)
    {
        this.players.push(player)
    }
}
export const werewolf: Werewolf = new Werewolf();