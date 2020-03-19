import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';

class EditorialNoteContentView extends StatelessWidget {
  final DeviceInfo deviceInfo;

  EditorialNoteContentView({Key key, this.deviceInfo}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: deviceInfo.size.height * 4 / 3,
        height: deviceInfo.size.height - 60,
        padding: EdgeInsets.all(8.0),
        child: EasyWebView(
          src: markDown,
          isMarkdown: true,
          widgetsTextSelectable: true,
          webAllowFullScreen: false,
        ),
        /*child: Markdown(
          data: markDown,
          selectable: true,
        )*/
      ),
    );
  }
}

const String markDown = """
　こんにちは、KCS2020新歓特設ページを見てくださり、ありがとうございます。
私は疲れたのでMarkdownでこれを書いています。

# 自己紹介
　基本作ったのは私、fastriverです。軽く自己紹介します。

+ Twitter: @fastriver_org
+ 所属: 理工学部電気情報工学科(2020/04~)
+ 志木高出身
+ 役職: KCS 日吉代表, Web班班長
+ やってること: Flutterでアプリ/Web開発, KotlinでAndroid, GASでわちゃわちゃ

　日吉代表の他に総代表とかいますが、実質日吉代表が責任者です。
Web班の班長になったりしている割にはHTMLが書けません(Flutter Webに逃げたので...)。

　本業はKotlinなのでKCSにアプリ開発班を立ち上げたい所存です、
興味ある人はとりあえずWeb班に来てね!

# 新歓ホームページについて
　元々作る予定がなかった新歓HP(2月には跡形もなかった)、なぜ作ったのか?

　最初の方のcommit見ればわかるのですが、
このページは某大学の某団体に多大な影響を受けて制作を始めています
(関わりはないですが尊敬してます！)。

　他の団体がやってるならうちがやってないのはおかしいだろう(?)という考えのもと
ちょうど新歓が消失した時期だったので私が勝手に作り始めました。
なのでほぼずっと1人ないしは2人程度の意思決定で大体のページを作っています。

## なぜFlutterなのか？
　激重じゃないか、なんでWeb用途じゃないフレームワーク使ってんだ、
という話ですが、実は最初はAngularDartで作ろうとしてました。
ただ私はWeb初心者。裏のシステムはともかく表示にはHTMLとCSSが必要と知り
Flutter Webへと逃げ込みました(この間1日弱)。

　Flutter Webの大きな特徴は、サイトを作るのに基本一切HTML/CSSを触らないということです。
すべての要素をスマホアプリ的に配置していくだけでUIができあがります。
着手から公開まで1週間というタイトなスケジュールで作るのには
慣れ親しんだFlutterで作るのがベストだろうと考え採用しました。

## 重い・重い・重い
　Flutter Webの難点はとにかく重いことです。特に
+ 最初の読み込み
+ スクロール
+ 画像読み込み

が厳しく、普通のブログ程度の分量ですら閲覧のツラい前衛的なページができあがりました。

<blockquote class="twitter-tweet" data-partner="tweetdeck"><p lang="ja" dir="ltr">重い！重い！重い！三重苦</p>&mdash; Fastriver (@Fastriver_org) <a href="https://twitter.com/Fastriver_org/status/1237396146131107840?ref_src=twsrc%5Etfw">March 10, 2020</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

## 改善案(妥協案)
　流石にこれを世に出すことはできん、と思い色々と試行錯誤しました。
+ AMP対応してキャッシュを活用
+ 画像をなるべく軽く
+ なるべくスクロールさせないUI
+ スクロールのあるページは遅延読み込み(メインページは見ている箇所以外不可視にしている)
こうして激重程度のページが出来上がったわけです。

　Flutter Webの重さをもっと体感してみたい方は作品集の「つらたん」「年賀状」あたりを
プレイしてみると良いと思います。特につらたんは「遊んでいるとスマホが熱くなる」など
定評をいただいています。
　
<blockquote class="twitter-tweet" data-partner="tweetdeck"><p lang="ja" dir="ltr">つらたん計算資源を異常に食う説検証(Chromium Edge)<br>1枚目がホーム画面のみ<br>2枚目がつらたんプレイ中<br>CPU+20%<br>メモリ+150MB <a href="https://t.co/at2jznTQUF">pic.twitter.com/at2jznTQUF</a></p>&mdash; Fastriver (@Fastriver_org) <a href="https://twitter.com/Fastriver_org/status/1226500976099483649?ref_src=twsrc%5Etfw">February 9, 2020</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

# サークル紹介
　唐突ですが、サークル選びに迷える新入生、また新たにどこかコミュニティを探している2年生以上
のために周りのサークルの個人的見解を述べていこうと思います(編集後記だから許されるよね！)。

## Computer Society(KCS)

<a target="_blank" href="https://twitter.com/kcs1959">Twitter: @kcs1959</a>

<a target="_blank" href="https://kcs1959.jp">ホームページ</a>

我らがKCS。チームになって何かをつくる、というよりは個々人が情報交換をしながら
専門分野を突き進む学術的志向の強いサークルです。その分初心者に対しても講習会や
勉強会が充実していて、何か個人的な目標を持って活動をするのには最適なサークルだと
思います。とは言ってもその志向すら自由なので、何人か集まって共同制作する人たちも
多いです。規模の大きく歴史も長いサークルなので人脈には困りません。
とりあえず入ってみては？()

## ロボット技術研究会(ロ技研/KRA)

<a target="_blank" href="https://twitter.com/KRA_Rogiken">Twitter: @KRA_Rogiken</a>

<a target="_blank" href="https://keiorogiken.wordpress.com/">ホームページ</a>

KCSとの兼部が割と多いロ技研です。私も機構班に所属しています。
名前の通りロボットを作ることを生業とした技術系サークルで、各種ロボコンに参加したり、
部員がオリジナルのロボットを開発したりなどしています。最近ではNHK学生ロボコンで
テレビに出たり、飛行ロボコン(自作飛行機を飛ばす)で入賞したり実績も高いです。
1年生の時から主体的にロボコンに参加できる(参加させられる)ので
ロボットを作ってみたい/動かしてみたい、という人は行ってみてください。

結構ブラックだったりする

## 宇宙科学総合研究会(LYNCS)

<a target="_blank" href="https://twitter.com/keio_LYNCS">Twitter: @keio_LYNCS</a>

<a target="_blank" href="https://lyncs-keio.net/">ホームページ</a>

主に天文系の分野に明るい技術系サークルです。缶サットなどもやっているので
ロ技研に近い印象を勝手に持っています。こことロ技研の2つは、所属していると
矢上のマニュファクチャリングセンター(工場)が使えて便利です(本来は学部4年からしか使えない)。
また、KCS・ロ技研・LYNCS+慶應諸高校の部活でKeio Tech Associationという連合を
作っていたりします。

## 超電子工学研究会(超電工研)

<a target="_blank" href="https://twitter.com/chodenkoken">Twitter: @chodenkoken</a>

<a target="_blank" href="https://denkoken.github.io/?topic=index">ホームページ</a>

電子工作とAI系に強い技術系サークルです。規模は大きくないですがレベルの高い人が多く、
マイコンなど組み込み系をやりたい人はよいかもしれないです。

## 日吉剣友会(KLA)

<a target="_blank" href="https://twitter.com/keiokkendo">Twitter: @keiokkendo</a>

技術サークルではないですが友人が主務を務めているので紹介。
矢上小学校の体育館を借りて稽古をしている。結構活発に活動しているもよう。
三田祭ではチュロスをKCSのブースに売り込んできた。

## 俳句研究会

<a target="_blank" href="https://twitter.com/keio_haiku">Twitter: @keio_haiku</a>

これも友人が日吉代表なので紹介。月一ペースくらいで句会を開催している。
何気に歴史が長いらしい。

# 謝辞
ほとんど私の狂気によってできたこのサイトですが、ここまで見てくださった皆さん
ありがとうございました。
また写真を大量に作ってくれた Ultimateくん、サイトに色々指摘してくださった方々、
作品など素材を提供してくれた人々、その他諸々に深く感謝申し上げます。

皆さん是非KCSに遊びに来てくださいね！

2020/03/20 午前3時55分 

@fastriver_org

(なぜ中華フォントになってしまうのか)

""";