import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'style/TextStyles.dart';

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
                "Introducing KCS",
                style: BaseTextStyles.h1(deviceInfo),
              ),
              Padding(
                padding: EdgeInsets.all(32),
                child: Center(
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 100.0,
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
                                fontSize: 100.0,
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
                                fontSize: 100.0,
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
                                child: Text("班紹介", style: BaseTextStyles.h2,),
                              ),
                              Icon(Icons.open_in_new, color: Color(0x99ffffff),)
                            ],
                          ),
                        ),
                        Image.asset("image/groupintroduce.jpg", fit: BoxFit.fitWidth,),
                      ],
                    ),
                  ),
                ),
              ),
              SelectableText(
                "こんにちは！　Keio Computer Society(通称:KCS)です。KCSは1959年から活動している日本最古のコンピュータサークルで、慶應最大規模の技術系サークルです。現在は主にAI、Unity、Blender、DTM、Webの5班でそれぞれに特化した活動を行っています。基本方針は「パソコン使って全部やる」。そのため部員は班だけでなくコンピュータを用いた幅広い活動をしています。レベルは様々で、基礎的な話から研究レベルまでやっています。また独自の講習会や勉強会・輪講会などを多く開催しており、部員同士の技術の交流も盛んです。",
                style: BaseTextStyles.plain,
              ),
              ResponsiveGridRow(
                children: [/*
                  ResponsiveGridCol(
                    lg: 12,
                    md: 6,
                    sm: 12,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        color: Color(0x17ffffff),
                        child: Column(
                          children: <Widget>[
                            Image.asset("image/group_tekitou.png", fit: BoxFit.fitWidth,),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text("班紹介", style: BaseTextStyles.h2,),
                                  ),
                                  Icon(Icons.open_in_new, color: Color(0x99ffffff),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),*/
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
                          child: Image.asset("image/events.jpg", fit: BoxFit.fitWidth),
                        ),
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
                          child: Image.asset("image/characters.jpg", fit: BoxFit.fitWidth),
                        ),
                      ),
                    ),
                  ),
                ],
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