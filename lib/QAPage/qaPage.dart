import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/QAPage/qaContentView.dart';
import 'package:kcs_2020_shinkan_web/mainAppBar.dart';
import 'package:kcs_2020_shinkan_web/mainFooter.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/view/subAppBar.dart';

class QAPage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    analytics().logEvent("PAGE_QA", null);
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          deviceInfo = DeviceInfo.measure(boxConstraints.biggest);
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SubAppBar(deviceInfo: deviceInfo,),
                QAContentView(deviceInfo: deviceInfo,),
                MainFooter(deviceInfo: deviceInfo, shareText: "KCS新歓特設ページ2020 -よくある質問 \n https://kcs1959.github.io/2020new/#/questions/",)
              ],
            ),
          );
        },
      ),
    );
  }
}