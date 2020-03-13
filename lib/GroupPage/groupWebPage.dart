import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupInfoLayout.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';

class GroupWebPage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    analytics().logEvent("PAGE_WEB", null);
    return Scaffold(
        backgroundColor: Color(0x80FFFFFF),
        body: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: LayoutBuilder(
              builder: (context, boxConstraint) {
                deviceInfo = DeviceInfo.measure(boxConstraint.biggest);
                return GroupInfoLayout(
                  heroTag: "WEB",
                  color: Colors.green,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Web班", style: BaseTextStyles.h1(deviceInfo),),
                    ),
                    Image.asset("image/groups/web.jpg", fit: BoxFit.fitWidth,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Web班ではサイトの作り方から最新フレームワークの習得まで幅広い技術を勉強しています。Web技術は学習コストなどの理由から敬遠されがちですが これらは使いこなせれば非常に実用的なものです。KCSには経験者や同じ目標を持つ仲間の中で互助的に学ぶ環境があります。広く深いWebの世界に触れてみませんか?", style: BaseTextStyles.plain,),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("閉じる", style: BaseTextStyles.button,),
                    )
                  ],
                );
              }
          ),
        )
    );
  }
}