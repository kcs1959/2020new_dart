import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupInfoLayout.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';

class GroupAIPage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    analytics().logEvent("PAGE_AI", null);
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
              heroTag: "AI",
              color: Colors.red,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("AI班", style: BaseTextStyles.h1(deviceInfo),),
                ),
                Image.asset("image/groups/ai.jpg", fit: BoxFit.fitWidth,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("  AI班では、今流行りのAIとプログラミングの勉強をしています。矢上祭、三田祭に向けたAIを用いたアプリ開発も行っています。\n  KCS AI班独自の勉強会も行うので、初心者の方も大歓迎です。", style: BaseTextStyles.plain,),
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