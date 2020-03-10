import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/view/underConstructionView.dart';

class ShinkanContentView extends StatelessWidget {
  final DeviceInfo deviceInfo;

  ShinkanContentView({Key key, this.deviceInfo}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnderConstructionView(deviceInfo: deviceInfo,);
  }
}