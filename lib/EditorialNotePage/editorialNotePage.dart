import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/EditorialNotePage/editorialNoteContentView.dart';
import 'package:kcs_2020_shinkan_web/mainFooter.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/view/subAppBar.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class EditorialNotePage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    analytics().logEvent("PAGE_EDITORIAL", null);
    return Scaffold(
      backgroundColor: Color(0xFF80CBC4),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          deviceInfo = DeviceInfo.measure(boxConstraints.biggest);
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SubAppBar(
                  deviceInfo: deviceInfo,
                  title: Text(
                    "編集\n後記",
                    style: TextStyle(
                        fontFamily: "CorporateLogo",
                        color: Colors.black,
                        fontSize: 20.0
                    ),
                  ).safeText(),
                  menuColor: Color(0xDE121212),
                ),
                EditorialNoteContentView(deviceInfo: deviceInfo,),
                MainFooter(deviceInfo: deviceInfo, tint: Colors.black,)
              ],
            ),
          );
        },
      ),
    );
  }
}