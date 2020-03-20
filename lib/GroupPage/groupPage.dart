import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupContentView.dart';
import 'package:kcs_2020_shinkan_web/mainFooter.dart';
import 'package:kcs_2020_shinkan_web/util/DeviceInfo.dart';
import 'package:kcs_2020_shinkan_web/view/subAppBar.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class GroupPage extends StatelessWidget {
  DeviceInfo deviceInfo;
  
  @override
  Widget build(BuildContext context) {
    analytics().logEvent("PAGE_GROUP", null);
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          deviceInfo = DeviceInfo.measure(boxConstraints.biggest);
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SubAppBar(
                  deviceInfo: deviceInfo,
                  title: Text(
                    "班紹介",
                    style: TextStyle(
                        fontFamily: "CorporateLogo",
                        color: Colors.white,
                        fontSize: 40.0
                    ),
                  ).safeText(),
                ),
                GroupContentView(deviceInfo: deviceInfo,),
                MainFooter(deviceInfo: deviceInfo, shareText: "KCS新歓特設ページ2020 -班紹介 \n https://kcs1959.github.io/2020new/#/groups/",)
              ],
            ),
          );
        },
      ),
    );
  }
}
