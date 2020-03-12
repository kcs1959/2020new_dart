import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupContentView.dart';
import 'package:kcs_2020_shinkan_web/mainFooter.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/view/subAppBar.dart';

class GroupPage extends StatelessWidget {
  DeviceInfo deviceInfo;
  
  @override
  Widget build(BuildContext context) {
    //final Groups argument =  ModalRoute.of(context).settings.arguments;
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
                  ),
                ),
                GroupContentView(deviceInfo: deviceInfo,),
                MainFooter(deviceInfo: deviceInfo,)
              ],
            ),
          );
        },
      ),
    );
  }
}

enum Groups {
  AI, UNITY, WEB, BLENDER, DTM
}