import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/QAPage/questions.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/ext/hover_extensions.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';
import 'package:kcs_2020_shinkan_web/util/DeviceInfo.dart';

class MainQAView extends StatelessWidget {
  final DeviceInfo deviceInfo;

  MainQAView({Key key, this.deviceInfo}): super(key: key);

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
                "よくある質問",
                style: BaseTextStyles.h1(deviceInfo),
              ).safeText(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: SelectableText(
                  "KCSに関して多く寄せられる疑問をまとめました。",
                  style: BaseTextStyles.plain,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: Questions.getList.getRange(0, 3).map((qa) {
                    return ListTile(
                        title: Text("Q. ${qa.question}", style: BaseTextStyles.qasummary,).safeText(),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("A. ${qa.answer}", style: BaseTextStyles.plain,).safeText(),
                      ),
                    );
                  }).toList(),
                ),
              ),
              RaisedButton(
                color: Color(0x1cffffff),
                onPressed: () {
                  Navigator.of(context).pushNamed("/questions");
                },
                child: ListTile(
                  title: Text("全ての質問を見る", style: BaseTextStyles.button,).safeText(),
                  trailing: Icon(Icons.call_made, color: Color(0x99ffffff),)
                ),
              ).showCursorOnHover
            ],
          ),
        ),
      ),
    );
  }
}