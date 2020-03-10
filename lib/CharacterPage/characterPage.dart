import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/CharacterPage/characterContentView.dart';
import 'package:kcs_2020_shinkan_web/mainFooter.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/view/subAppBar.dart';

class CharacterPage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          deviceInfo = DeviceInfo.measure(boxConstraints.biggest);
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SubAppBar(deviceInfo: deviceInfo,),
                CharacterContentView(deviceInfo: deviceInfo,),
                MainFooter(deviceInfo: deviceInfo,)
              ],
            ),
          );
        },
      ),
    );
  }
}