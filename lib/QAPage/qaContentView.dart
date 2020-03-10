import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/view/underConstructionView.dart';

class QAContentView extends StatelessWidget {
  final DeviceInfo deviceInfo;

  QAContentView({Key key, this.deviceInfo}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnderConstructionView(deviceInfo: deviceInfo,);
    /*
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: deviceInfo.size.height * 4 / 3,
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text("よくある質問", style: BaseTextStyles.h1(deviceInfo),),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "質問を検索..."
              ),
            ),

          ],
        ),
      ),
    );*/
  }
}