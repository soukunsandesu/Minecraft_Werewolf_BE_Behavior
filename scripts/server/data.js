export const config =
{
    Rolls: [
        { name: "人狼", score: 1 },
        { name: "狂人", score: 2 },
        { name: "預言者", score: 3 },
        { name: "霊媒師", score: 4 },
        { name: "村人", score: 5 }],
    Initial: [
        { name: "観戦", score: 0, text: "観戦用のロール" },
        { name: "人狼", score: 1, text: "一般的な人狼、村人陣営を全滅させよう" },
        { name: "狂人", score: 2, text: "人狼陣営に寝返った村人" },
        { name: "預言者", score: 3, text: "対象が人狼か否かを判定できる" },
        { name: "霊媒師", score: 4, text: "死亡したプレイヤーが人狼か否かを判定できる" },
        { name: "村人", score: 5, text: "善良な村人、人狼を全滅させよう" },
        { name: "怪盗", score: 6, text: "ロールを盗む。盗まれた対象は村人となる" },
        { name: "猫又", score: 7, text: "死亡した時、誰かを道ずれにする" },
        { name: "狐", score: 8, text: "村、もしくは人狼陣営が勝利した時\n生存していると勝利となる" },
        { name: "狂信者", score: 9, text: "あまりに人狼を崇拝した結果誰が人狼かわかる" },
        { name: "大狼", score: 10, text: "占われても黒とでない" },
        { name: "賢狼", score: 11, text: "死亡したプレイヤーの役職を知る事ができる" },
        { name: "パン屋", score: 12, text: "150秒置きにみんなにパンを配る" }
    ],
    setting: { item: true }
}