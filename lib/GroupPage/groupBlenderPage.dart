import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupInfoLayout.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';
import 'package:kcs_2020_shinkan_web/util/DeviceInfo.dart';

class GroupBlenderPage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    analytics().logEvent("PAGE_BLENDER", null);
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
                  heroTag: "BLENDER",
                  color: Colors.orange,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Blender班", style: BaseTextStyles.h1(deviceInfo),).safeText(),
                    ),
                    Image.asset("image/groups/blender.jpg", fit: BoxFit.fitWidth,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(),
                      //child: Text("  3Dモデルや3DCGが作れるBlenderというソフトを使って製作しています。", style: BaseTextStyles.plain,),
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