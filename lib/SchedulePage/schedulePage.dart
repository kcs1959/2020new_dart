import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/SchedulePage/scheduleContentView.dart';
import 'package:kcs_2020_shinkan_web/mainFooter.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/util/DeviceInfo.dart';
import 'package:kcs_2020_shinkan_web/view/subAppBar.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class SchedulePage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    analytics().logEvent("PAGE_SCHEDULE", null);
    return Scaffold(
      backgroundColor: Color(0xFFFFCC80),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          deviceInfo = DeviceInfo.measure(boxConstraints.biggest);
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SubAppBar(
                  deviceInfo: deviceInfo,
                  title: Text(
                    "年間行事",
                    style: BaseTextStyles.logoTint(tint: Color(0xFF1A237E)),
                  ).safeText(),
                  menuColor: Color(0xFF1A237E),
                ),
                ScheduleContentView(deviceInfo: deviceInfo,),
                MainFooter(deviceInfo: deviceInfo, tint: Color(0xFF1A237E),shareText: "KCS新歓特設ページ2020 -年間行事 \n https://kcs1959.github.io/2020new/#/schedule",)
              ],
            ),
          );
        },
      ),
    );
  }
}
