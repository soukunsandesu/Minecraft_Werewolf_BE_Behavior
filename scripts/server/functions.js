import { world, ItemStack, Entity } from "@minecraft/server";
// ItemTypes, Enchantmentを除外
import { config } from "./data";
export class F {
    /**コマンドをワールド基準で実行
     * @param {String} cmd 実行するコマンド
     * @returns コマンドの実行結果
    */
    static RunCommand(cmd) { return world.getDimension("overworld").runCommandAsync(cmd) }
    /**console.logの代理
     * @param {any} ms 出力したい文字列(文字列以外でも可)
     */
    static Say(ms) {
        if (ms == undefined) ms = 'undefined'
        this.RunCommand(`say "${String(ms)}"`)
    }
    /**リストからランダムに選択する
     * @param {any} L 抽選するリスト
     * @returns 選択されたリストの要素
     */
    static ListR(L) { return L[Math.floor(Math.random() * L.length)] }
    
    static giveItem(user, id, count, name, lore, CanPlaceOn, CanDestroy) {
        // lore=["§rtest item§r", "+10 coolness", "§p+4 shiny§r"]
        if (id.match(/^\//)) {
            user.runCommandAsync(id)
        } else {
            if (id.match(/^§/)) {
                let item = config.Items.filter((e) => e.name == id)[0]
                if (item == undefined) return this.Say('giveItemのエラー:アイテム名の不一致')
                id = item.id
                name = item.name
                lore = item.lore
            }
            if (!id.match(/minecraft:/)) { id = 'minecraft:' + id }
            if (count == undefined) count = 1
            let giveItem = new ItemStack(ItemTypes.get(id), Number(count))
            if (name) giveItem.nameTag = name
            if (lore) {
                if (!Array.isArray(lore)) {
                    if (lore.match(/\n/)) { lore.split('\n') } else { lore = [lore] }
                }
                giveItem.setLore(lore)
            }
            if (CanPlaceOn && CanPlaceOn != '') {
                if (!Array.isArray(CanPlaceOn)) {
                    if (CanPlaceOn.match(/\./)) { CanPlaceOn.split('.') } else { CanPlaceOn = [CanPlaceOn] }
                }
                giveItem.setCanPlaceOn(CanPlaceOn)
            }
            if (CanDestroy && CanDestroy != '') {
                if (!Array.isArray(CanDestroy)) {
                    if (CanDestroy.match(/\./)) { CanDestroy.split('.') } else { CanDestroy = [CanDestroy] }
                }
                giveItem.setCanDestroy(CanDestroy)
            }
            user.getComponent('minecraft:inventory').container.addItem(giveItem)
        }
    }
    /**
     * ノックバックをユーザーの視点方向へ付与
     * @param {Entity} user 与えるエンティティ
     * @param {Number} power 与えるノックバックの値
     * @param {bool} scoreOn trueの場合、スコアボードをノックバック値として用いる 
     */
    static addKnockback(user, power = 15, scoreOn = false) {
        let Rotat = user.getRotation(), score = user?.scoreboardIdentity
        if (scoreOn && score != undefined) power = world.scoreboard.getObjective('jumpPower').getScore(score)
        power /= 10
        let theta = Rotat.y * 0.01745, yr = Rotat.x / -220 * power + 0.5
        user.applyKnockback(power * Math.sin(theta) * -1, power * Math.cos(theta), power, yr)
    }
}