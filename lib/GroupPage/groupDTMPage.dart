import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupInfoLayout.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';
import 'package:kcs_2020_shinkan_web/util/DeviceInfo.dart';

class GroupDTMPage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    analytics().logEvent("PAGE_DTM", null);
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
                  heroTag: "DTM",
                  color: Colors.purple,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("DTM班", style: BaseTextStyles.h1(deviceInfo),).safeText(),
                    ),
                    Image.asset("image/groups/dtm.jpg", fit: BoxFit.fitWidth,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "  DTM班では各種DAW(Studio One, Cubase, Logicなどの作曲ソフト)を使って曲を作り、秋のM3でCDを売っています!\n  普段はDAWの使い方、音楽理論の講習会等行っています!!",
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