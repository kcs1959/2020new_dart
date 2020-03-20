import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/CharacterPage/characterContentView.dart';
import 'package:kcs_2020_shinkan_web/mainFooter.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/util/DeviceInfo.dart';
import 'package:kcs_2020_shinkan_web/view/subAppBar.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class CharacterPage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    analytics().logEvent("PAGE_CHARACTER", null);
    return Scaffold(
      backgroundColor: Color(0xFF00BCD4),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          deviceInfo = DeviceInfo.measure(boxConstraints.biggest);
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SubAppBar(
                  deviceInfo: deviceInfo,
                  title: Text(
                    "公式\nキャラクター",
                    style: BaseTextStyles.halfLogo,
                  ).safeText(),
                  menuColor: Color(0xFF004D40),
                ),
                CharacterContentView(deviceInfo: deviceInfo,),
                MainFooter(deviceInfo: deviceInfo, tint: Color(0xFF004D40), shareText: "KCS新歓特設ページ2020 -キャラクター紹介 \n https://kcs1959.github.io/2020new/#/character",)
              ],
            ),
          );
        },
      ),
    );
  }
}