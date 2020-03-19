import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/QAPage/qaContentView.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/util/link.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/ext/hover_extensions.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class MainWhatIsKCSView extends StatelessWidget {
  final DeviceInfo deviceInfo;

  MainWhatIsKCSView({Key key, this.deviceInfo}): super(key: key);

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
                "KCSって何?",
                style: BaseTextStyles.h1(deviceInfo),
              ).safeText(),
              Padding(
                padding: EdgeInsets.all(32),
                child: Center(
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: deviceInfo.device == Device.PC ? 100.0 : 60.0,
                              color: Colors.white
                            ),
                            children: <TextSpan>[
                              TextSpan(text: "K", style: TextStyle(color: Colors.red)),
                              TextSpan(text: "eio")
                            ]
                          ),
                      ),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: deviceInfo.device == Device.PC ? 100.0 : 60.0,
                                color: Colors.white
                            ),
                            children: <TextSpan>[
                              TextSpan(text: "C", style: TextStyle(color: Colors.yellow)),
                              TextSpan(text: "omputer")
                            ]
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: deviceInfo.device == Device.PC ? 100.0 : 60.0,
                                color: Colors.white
                            ),
                            children: <TextSpan>[
                              TextSpan(text: "S", style: TextStyle(color: Colors.green)),
                              TextSpan(text: "ociety")
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("/groups");
                  },
                  child: Card(
                    color: Color(0x17ffffff),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text("班紹介", style: BaseTextStyles.h2,).safeText(),
                              ),
                              Icon(Icons.call_made, color: Color(0x99ffffff),)
                            ],
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 3/1,
                            child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      "AI/Unity/Web/Blender/DTM",
                                      style: TextStyle(
                                          fontFamily: "CorporateLogo",
                                          color: Colors.white60,
                                          fontSize: 50.0
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(child: Image.asset("image/groupintroduce.jpg", fit: BoxFit.fitWidth,))
                                ],
                            )
                        ),
                      ],
                    ),
                  ).showCursorOnHover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: SelectableText(
                  "  こんにちは！　Keio Computer Society(通称:KCS)です。\n  KCSは1959年から活動している日本最古のコンピュータサークルで、慶應最大規模の技術系サークルです。基本方針は「パソコン使って全部やる」。\n  現在は主にAI、Unity、Blender、DTM、Webの5班でそれぞれに特化した活動を行っています。部員は班活動だけでなく、幅広い分野で基礎から研究レベルまで様々な活動をしています。また独自の講習会や勉強会・輪講会などを多く開催しており、部員同士の技術の交流も盛んです。",
                  style: BaseTextStyles.plain,
                ),
              ),
              Text(
                "基本情報",
                style: BaseTextStyles.h2,
                textAlign: TextAlign.center,
              ).safeText(),
              ListTile(
                title: Text(
                  "概要",
                  style: BaseTextStyles.h4,
                  textAlign: TextAlign.center,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "慶應義塾大学公認団体 独立団体 Computer Society",
                      style: BaseTextStyles.plain,
                    textAlign: TextAlign.center,
                  ).safeText(),
                ),
              ),
              ListTile(
                title: Text(
                  "会員",
                  style: BaseTextStyles.h4,
                  textAlign: TextAlign.center,
                ).safeText(),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "55名",
                    style: BaseTextStyles.plain,
                    textAlign: TextAlign.center,
                  ).safeText(),
                ),
              ),
              ListTile(
                title: Text(
                  "活動場所",
                  style: BaseTextStyles.h4,
                  textAlign: TextAlign.center,
                ).safeText(),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "日吉キャンパス塾生会館213号室/その他日吉・矢上内教室",
                    style: BaseTextStyles.plain,
                    textAlign: TextAlign.center,
                  ).safeText(),
                ),
              ),
              ListTile(
                title: Text(
                  "活動日/時間",
                  style: BaseTextStyles.h4,
                  textAlign: TextAlign.center,
                ).safeText(),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "不定(各活動の参加者で調整)",
                    style: BaseTextStyles.plain,
                    textAlign: TextAlign.center,
                  ).safeText(),
                ),
              ),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    lg: 6,
                    md: 6,
                    sm: 12,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/schedule");
                        },
                        child: Card(
                          color: Color(0x17ffffff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0))
                          ),
                          child: AspectRatio(
                            aspectRatio: 3/1,
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: AutoSizeText("年間行事", style: BaseTextStyles.h2,),
                                  ),
                                  Positioned.fill(child: Image.asset("image/events.jpg", fit: BoxFit.fitWidth)),
                                ],
                              )
                          ),
                        ).showCursorOnHover,
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: 6,
                    md: 6,
                    sm: 12,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/character");
                        },
                        child: Card(
                          color: Color(0x17ffffff),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16.0))
                          ),
                          child: AspectRatio(
                              aspectRatio: 3/1,
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: AutoSizeText("キャラクター紹介", style: BaseTextStyles.h2,),
                                  ),
                                  Positioned.fill(child: Image.asset("image/characters.jpg", fit: BoxFit.fitWidth),),
                                ],
                              )
                          ),
                        ).showCursorOnHover,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    linkCard("講習会一覧", "2020年度講習会情報", Icon(Icons.description, size: 48.0, color: Colors.white38,), Link.toSessionsKCS).showCursorOnHover,
                  ],
                ),
              )
              /*
              //豆知識
               */
            ],
          ),
        ),
      ),
    );
  }
}