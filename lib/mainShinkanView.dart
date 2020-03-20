import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/util/DeviceInfo.dart';
import 'package:kcs_2020_shinkan_web/util/link.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';
import 'package:kcs_2020_shinkan_web/ext/hover_extensions.dart';
import 'package:kcs_2020_shinkan_web/wid/linkCard.dart';

class MainShinkanView extends StatelessWidget {
  final DeviceInfo deviceInfo;

  MainShinkanView({Key key, this.deviceInfo}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff121212),
      width: deviceInfo.size.width,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: deviceInfo.size.height * 4 / 3,
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "新歓情報",
                style: BaseTextStyles.h1(deviceInfo),
              ).safeText(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0x80b71c1c),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(0xFFB00020),
                      width: 3.0
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "新型コロナウイルスの影響について",
                          style: BaseTextStyles.h4,
                        ).safeText(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                          child: SelectableText(
                            "当初予定していた4月2日から6日までの新歓オリエンテーションが中止となり慶應内での勧誘も全面禁止となっております。3月中旬の時点でまだ来年度の大学側の予定も分からないため詳細な情報を告知することが出来ません。お手数ですが公式LINE@やTwitterから最新情報をご確認ください。",
                            style: BaseTextStyles.plain,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    linkCard("LINE@", "新歓情報", Image.asset("image/linelogo.png", height: 48), Link.toLineKCS).showCursorOnHover,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}