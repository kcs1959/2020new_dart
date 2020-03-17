import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupInfoLayout.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class GroupUnityPage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    analytics().logEvent("PAGE_UNITY", null);
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
                  heroTag: "UNITY",
                  color: Colors.blue,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Unity班", style: BaseTextStyles.h1(deviceInfo),).safeText(),
                    ),
                    Image.asset("image/groups/yunity.jpg", fit: BoxFit.fitWidth,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "  Unityというゲームエンジンでゲーム製作を行っています。\n  ゲーム開発に興味がない人でもUnityを使えばスマホアプリやAR-VRを手軽に開発することが出来ます。未経験者向けの講習も予定しています。",
                        style: BaseTextStyles.plain,
                      ).safeText(),
                    ),
                    RaisedButton(
                      color: Color(0x61000000),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("閉じる", style: BaseTextStyles.button,).safeText(),
                    )
                  ],
                );
              }
          ),
        )
    );
  }
}