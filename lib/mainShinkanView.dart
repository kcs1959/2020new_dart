import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';

class MainShinkanView extends StatelessWidget {
  final DeviceInfo deviceInfo;

  MainShinkanView({Key key, this.deviceInfo}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff121212),
      width: deviceInfo.size.width,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: deviceInfo.size.height * 4 / 3,
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "新歓情報",
                style: BaseTextStyles.h1(deviceInfo),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0x80b71c1c),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(0xFFB00020),
                      width: 3.0
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "新型コロナウイルスの影響について",
                          style: BaseTextStyles.h4,
                        ),
                        SelectableText(
                          "当初予定していた4月2日から6日までの新歓オリエンテーションが中止となり慶應内での勧誘も全面禁止となっております。3月中旬の時点でまだ来年度の大学側の予定も分からないため詳細な情報を告知することが出来ません。お手数ですが公式LINE@やTwitterから最新情報をご確認ください。",
                          style: BaseTextStyles.plain,
                        )
                      ],
                    ),
                  ),
                ),
              )
              /*
              SelectableText(
                "安政3年（1856年）、再び大坂へ出て学ぶ。同年、兄が死に福澤家の家督を継ぐことになる。しかし大坂遊学を諦めきれず、父の蔵書や家財道具を売り払って借金を完済したあと、母以外の親類から反対されるもこれを押し切って大坂の適塾で学んだ。",
                style: BaseTextStyles.plain,
              ),
              Text(
                "説明会",
                style: BaseTextStyles.h2,
              ),
              Center(
                child: Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    AutoSizeText(
                      "4月2日(木) 10:00-11:00 第3校舎311\n"
                      + "4月3日(金) 12:00-13:00 第4校舎J435B\n"
                      + "4月4日(土) 15:00-16:00 第4校舎J422\n"
                      + "4月6日(月) 13:00-14:00 第4校舎J412",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough
                      ),
                    )
                  ],
                ),
              ),
              SelectableText(
                "安政4年（1857年）には最年少22歳で適塾の塾頭となり、後任に長与専斎を指名した。適塾ではオランダ語の原書を読み、あるいは筆写し、時にその記述に従って化学実験、簡易な理科実験などをしていた。ただし生来血を見るのが苦手であったため瀉血や手術解剖のたぐいには手を出さなかった。",
                style: BaseTextStyles.plain,
              ),
              Text(
                "食事会",
                style: BaseTextStyles.h2,
              ),
              Text(
                "幕末の時勢の中、無役の旗本で石高わずか40石の勝安房守（号は海舟）らが登用されたことで、安政5年（1858年）、諭吉にも中津藩から江戸出府を命じられる（差出人は江戸居留守役の岡見清熙）。",
                style: BaseTextStyles.plain,
              ),
              Text(
                "新歓合宿",
                style: BaseTextStyles.h2,
              ),
              Text(
                "元来、この蘭学塾は佐久間象山の象山書院から受けた影響が大きく、マシュー・ペリーの渡来に先んじて嘉永3年（1850年）ごろからすでに藩士たちが象山について洋式砲術の教授を受け、月に5〜6回も出張してもらって学ぶものも数十名に及んでいる。藩士の中にも、島津文三郎のように象山から直伝の免許を受けた優秀な者がおり、その後は杉亨二（杉はのちに勝海舟にも通じて氷解塾の塾頭も務める）、薩摩藩士の松木弘安を招聘していた。諭吉が講師に就任してからは、藤本元岱・神尾格・藤野貞司・前野良伯らが適塾から移ってきたほか、諭吉の前の適塾塾頭・松下元芳が入門するなどしている。",
                style: BaseTextStyles.plain,
              )*/
            ],
          ),
        ),
      ),
    );
  }
}