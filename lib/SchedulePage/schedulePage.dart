import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/SchedulePage/scheduleContentView.dart';
import 'package:kcs_2020_shinkan_web/mainFooter.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/view/subAppBar.dart';

class SchedulePage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
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
                    style: TextStyle(
                        fontFamily: "CorporateLogo",
                        color: Color(0xFF1A237E),
                        fontSize: 40.0
                    ),
                  ),
                  menuColor: Color(0xFF1A237E),
                ),
                ScheduleContentView(deviceInfo: deviceInfo,),
                MainFooter(deviceInfo: deviceInfo, tint: Color(0xFF1A237E),)
              ],
            ),
          );
        },
      ),
    );
  }
}
