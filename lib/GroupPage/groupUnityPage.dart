import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupInfoLayout.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';

class GroupUnityPage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x80FFFFFF),
        body: LayoutBuilder(
            builder: (context, boxConstraint) {
              deviceInfo = DeviceInfo.measure(boxConstraint.biggest);
              return GroupInfoLayout(
                heroTag: "UNITY",
                color: Colors.blue,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Unity班", style: BaseTextStyles.h1(deviceInfo),),
                  ),
                  Image.asset("image/groups/unity.jpg", fit: BoxFit.fitWidth,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Unityというゲームエンジンでゲーム製作を行っています。ゲーム開発に興味がない人でもUnityを使えばスマホアプリやAR-VRを手軽に開発することが出来ます。未経験者向けの講習も予定しています。", style: BaseTextStyles.plain,),
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
        )
    );
  }
}