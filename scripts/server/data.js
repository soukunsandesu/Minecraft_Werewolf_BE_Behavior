import { FORM } from "./form";
import { F } from "./functions";
export const config = {
    Rolls: [{ name: "人狼", score: 1 }, { name: "狂人", score: 2 }, { name: "預言者", score: 3 }, { name: "霊媒師", score: 4 }],
    Initial: [
        {
            name: "観戦", team: 0, score: 0, text: "観戦用のロール", Commentary: "観戦用のロール\n開始時に§c待機中§rのプレイヤーに割り当てられる",
            deadF: function (user) { return }
        },
        {
            name: "人狼", team: 1, score: 1, text: "一般的な人狼、村人陣営を全滅させよう", Commentary: "陣営:人狼 タイプ:黒人外\n占い:黒 霊媒:黒\nダイヤモンド:消費する事で停電、テレポート、アイテムを取得する",
            deadF: function (user) { FORM.werewolf(user); return }
        },
        {
            name: "狂人", team: 2, score: 2, text: "人狼陣営に寝返った村人", Commentary: "陣営:人狼 タイプ:白人外\n占い:白 霊媒:白",
            deadF: function (user) { return }
        },
        {
            name: "預言者", team: 3, score: 3, text: "対象が人狼か否かを判定できる", Commentary: "陣営:市民\n占い:白 霊媒:白\nダイヤモンド:消費する事で対象が人狼(黒)か否か判定する",
            deadF: function (user) { FORM.divination(user); return }
        },
        {
            name: "霊媒師", team: 3, score: 4, text: "死亡したプレイヤーが人狼か否かを判定できる", Commentary: "陣営:市民\n占い:白 霊媒:白\nダイヤモンド:消費する事で死亡した対象が人狼(黒)か否か判定する\n死亡していないプレイヤーに使用した場合は「魂は見つかりませんでした…」と返ってくる",
            deadF: function (user) { FORM.psychic(user); return }
        },
        {
            name: "村人", team: 3, score: 5, text: "善良な村人、人狼を全滅させよう", Commentary: "陣営:市民\n占い:白 霊媒:白",
            deadF: function (user) { return }
        },
        {
            name: "怪盗", team: 3, score: 6, text: "ロールを盗む。盗まれた対象は村人となる", Commentary: "陣営:市民\n占い:白 霊媒:白\nダイヤモンド:消費する事で対象から役職を盗み、盗まれた対象は村人となる\n盗まれた対象には通知されず、占い結果は白、霊媒は魂が見つからないと返る\n人狼はダイヤモンドを使用でき、クォーツも2個配布される",
            deadF: function (user) { FORM.thief(user); return }
        },
        {
            name: "猫又", team: 3, score: 7, text: "死亡した時、誰かを道ずれにする", Commentary: "陣営:市民\n占い:白 霊媒:白\n能力:自身が死亡した時、殺害したプレイヤーを２分の１で道ずれにする\n落下死や毒殺の場合はランダムなプレイヤーを道ずれにする",
            deadF: function (user) { return }
        },
        {
            name: "狐", team: 4, score: 8, text: "村、もしくは人狼陣営が勝利した時\n生存していると勝利となる", Commentary: "陣営:狐\n占い:死亡 霊媒:白",
            deadF: function (user) { return }
        },
        {
            name: "狂信者", team: 2, score: 9, text: "あまりに人狼を崇拝した結果誰が人狼かわかる", Commentary: "陣営:人狼\nタイプ:白人外\n占い:白 霊媒:白\n能力:開始時に人狼陣営を知る\n設定で知ることができる範囲を指定可能",
            deadF: function (user) { FORM.werewolf(user); return }
        },
        {
            name: "大狼", team: 1, score: 10, text: "占われても黒とでない", Commentary: "陣営:人狼 タイプ:黒人外\n占い:白 霊媒:黒\nダイヤモンド:消費する事で停電、テレポート、アイテムを取得する",
            deadF: function (user) { FORM.werewolf(user); return }
        },
        {
            name: "賢狼", team: 1, score: 11, text: "死亡したプレイヤーの役職を知る事ができる", Commentary: "陣営:人狼 タイプ:黒人外\n占い:黒 霊媒:黒\nダイヤモンド:消費する事で停電、テレポート、アイテムを取得する\n能力:プレイヤーが死亡した時、その人の役職を知る",
            deadF: function (user) { return }
        },
        {
            name: "パン屋", team: 3, score: 12, text: "150秒置きにみんなにパンを配る", Commentary: "陣営:市民\n占い:白 霊媒:白\n能力:150秒置きにパンを1つ配布する",
            deadF: function (user) { return }
        },
        {
            name: "囁く狂人", team: 1, score: 13, text: "白人外でありながら人狼チャットを送れる", Commentary: "陣営:人狼 タイプ:白人外\n占い:白 霊媒:白\n能力:人狼チャットを送れる",
            deadF: function (user) { return }
        },
        {
            name: "狼付き", team: 3, score: 14, text: "市民だが占い結果は黒になる", Commentary: "陣営:市民\n占い:黒 霊媒:白",
            deadF: function (user) { return }
        },
        {
            name: "王女", team: 3, score: 15, text: "死亡した時、市民陣営の敗北となる", Commentary: "陣営:市民\n占い:白 霊媒:白\n能力:開始時に市民陣営全員へ自分が女王である事を通知する\n※死亡時に市民陣営が敗北する",
            deadF: function (user) { return }
        },
        {
            name: "プリンセス", team: 3, score: 16, text: "女王が死亡した時、女王の代理となる", Commentary: "陣営:市民\n占い:白 霊媒:白\n能力:開始時に女王にプリンセスである事を通知する\n女王が死亡した時、自身が生存していると女王となり敗北を回避する",
            deadF: function (user) { return }
        },
        {
            name: "狩人", team: 3, score: 17, text: "対象を守る", Commentary: "陣営:市民\n占い:白 霊媒:白\n能力:選択したプレイヤーの死を回避させる",
            deadF: function (user) { FORM.hunter(user); return }
        },
        {
            name: "ボマー", team: 5, score: 18, text: "対象に爆弾を設置する\n他プレイヤーを全滅させることで勝利する", Commentary: "陣営:ボマー\n占い:白 霊媒:白\n能力:対象に爆弾を設置し、起爆ボタンを押す事で爆破する。\n他プレイヤーを全滅させることで勝利する\n自身が死亡するまで村、人狼陣営は勝利しない",
            deadF: function (user) { return }
        },
        {
            name: "光の使徒", team: 3, score: 19, text: "ランダムな市民陣営の役職に変化する", Commentary: "陣営:市民\n占い:n/a 霊媒:n/a\n能力:市民陣営の役職にランダムで変化する\n変化する可能性がある役職\n",
            deadF: function (user) { return }
        },
        {
            name: "闇の化身", team: 1, score: 20, text: "ランダムな人狼陣営の役職に変化する", Commentary: "陣営:人狼\n占い:n/a 霊媒:n/a\n能力:人狼陣営の役職にランダムで変化する\n変化する可能性がある役職\n人狼 狂人 狂信者 大狼 賢狼 囁く狂人",
            deadF: function (user) { return }
        },
        {
            name: "カウンセラー", team: 3, score: 21, text: "カウンセリングを行い、陣営を反転させる", Commentary: "陣営:市民\n占い:白 霊媒:白\n能力:市民陣営のプレイヤーをカウンセリングすると狂人に変化させ、\n人狼陣営のプレイヤーをカウンセリングすると市民に変化させる。\n変化させられたプレイヤーは変化した役職であることを認識する",
            deadF: function (user) { FORM.counselor(user); return }
        },
        {
            name: "吸血鬼", team: 1, score: 22, text: "傀儡の粉を開始時点で所持している", Commentary: "陣営:人狼 タイプ:黒人外\n占い:黒 霊媒:黒\nダイヤモンド:消費する事で停電、テレポート、アイテムを取得する\nプレイヤーを殺害するとHPが回復する",
            deadF: function (user) { FORM.werewolf(user); return }
        }
    ],
    // 説明用
    Items: [
        { name: "クォーツ", Commentary: "150秒置き(設定で変更可能)に配布され、0秒になると4個配布される\n4個集めてブロックをクラフトする事で弓矢を取得する" },
        { name: "弓", Commentary: "矢を放つ\nヒットしたエンティティに99ダメージを与える" },
        { name: "矢", Commentary: "弓を使用するのに必要" },
        { name: "ダイヤモンド", Commentary: "使用することで役職固有の能力を行使できる" },
        { name: "停電スイッチ(ヒマワリ)", Commentary: "使用することで自身以外のプレイヤーの視界を10秒間奪う" },
        { name: "エンダーアイ", Commentary: "§r§f最も遠いプレイヤーの方向を特定する\nしゃがみながら投げると最も近いプレイヤーの方向を特定する\n空中で使用する事で落下ダメージを軽減できる" },
        { name: "劣化ルイン(金の剣)", Commentary: "1擊で対象を倒せるが使用者に雷と自傷ダメージ\n対象及び自傷ダメージで死亡したプレイヤーのアイテムは消える" },
        { name: "掃除機(ホッパー)", Commentary: "使用する事でドロップしているアイテムを取得する" },
        { name: "透明化のポーション", Commentary: "飲むことで1分間だけ透明化する\n※ポーション効果がバニラと違う場合が一部あるので注意してください" },
        { name: "高速移動のポーション(スピードのポーション)", Commentary: "飲むことで1分間移動スピード+160%\n※ポーション効果がバニラと違う場合が一部あるので注意してください" },
        { name: "1擊必殺ポーション(力のスプラッシュポーション)", Commentary: "被弾したプレイヤーへ20ダメージ与える\n※ポーション効果がバニラと違う場合が一部あるので注意してください" },
        { name: "盾", Commentary: "矢を4発耐える\n(矢のダメージが高い為、耐えれる回数が少ない)" },
        { name: "トーテム", Commentary: "死を回避する\n※猫又の道ずれ、恋人の後追いは回避できない" },
        { name: "偽装ヘッド(スケルトンの頭)", Commentary: "装備することで変装する" },
        { name: "ウィザーのバラ", Commentary: "殴る事でウィザーを付与する\n45秒~1分30秒後にウィザーを2分間付与する" },
        { name: "地雷(ビーコン)", Commentary: "§4人狼陣営§r・§7ボマー§f以外が取得すると爆発する\n爆発すると周囲3ブロックのプレイヤーへダメージが入る" },
        { name: "C4爆弾(リスポーンアンカー)", Commentary: "§7ボマー§f以外が取得するとC4を仕掛けられる\nまた、殴ることでも仕掛けることができる" },
        { name: "起爆スイッチ(ボタン)", Commentary: "使用することで仕掛けたC4爆弾及びドロップ状態のC4爆弾を起爆する\n起爆することで周囲2ブロックのプレイヤーに30、周囲5ブロックのプレイヤーに20ダメージを与える" },
        { name: "羽", Commentary: "使用することで前方向へブリンクする\nしゃがみながら使用することでベクトルが2倍になり、落下速度低下が1秒付与される" },
        { name: "ポータル(紫色の色付きガラス板)", Commentary: "瞬間移動が可能なポータルを設置する\n使用して移動することで設置が可能" },
        { name: "残響の断片", Commentary: "使用することでシャウトする\n効果内のプレイヤーを吹き飛ばし、数秒スタンする" },
        { name: "チャット(棒)", Commentary: "全員に見えるクイックチャットを送る" },
        { name: "人狼チャット(棒)", Commentary: "使用する事で§4人狼陣営§fの黒人外へクイックチャットを送る\n黒人外以外のプレイヤーは見る事が出来ない" },
        { name: "ヘルプ棒(棒)", Commentary: "使用することで役職やアイテムの説明を閲覧する" },
        { name: "棒", Commentary: "OPを持つ場合\nゲームの設定画面が開く\nOPを持たない場合\n§c待機中§rと§a参加中§rを切り替える" }
    ],
    setting: { item: true, tp: false, lover: 0, Fanatic: true, thief: 450, time: 600, quartz: 150 }
}