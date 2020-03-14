import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/ShinkanPage/shinkanContentView.dart';
import 'package:kcs_2020_shinkan_web/mainFooter.dart';

import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/view/subAppBar.dart';

class ShinkanPage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    analytics().logEvent("PAGE_SHINKAN", null);
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          deviceInfo = DeviceInfo.measure(boxConstraints.biggest);
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SubAppBar(deviceInfo: deviceInfo,),
                ShinkanContentView(deviceInfo: deviceInfo,),
                MainFooter(deviceInfo: deviceInfo,shareText: "KCS新歓特設ページ2020 -新歓情報 \n https://kcs1959.github.io/2020new/#/shinkan",)
              ],
            ),
          );
        },
      ),
    );
  }
}