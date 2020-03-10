import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/ext/randomIcon.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';

class UnderConstructionView extends StatefulWidget {
  final DeviceInfo deviceInfo;

  UnderConstructionView({Key key, this.deviceInfo}): super(key: key);

  @override
  State<StatefulWidget> createState() => _UnderConstructionViewState();
}

class _UnderConstructionViewState extends State<UnderConstructionView> {
  var _icon = randomIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.deviceInfo.size.width,
      height: widget.deviceInfo.size.height,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _icon = randomIcon();
                });
              },
              child: Icon(
                _icon,
                size: 200,
                color: Colors.white,
              ),
            ),
            Text("現在制作中です", style: BaseTextStyles.h2,),
            Text("最新の情報は、Twitter(@kcs1959)でゲット！", style: BaseTextStyles.plain,)
          ],
        ),
      ),
    );
  }
}