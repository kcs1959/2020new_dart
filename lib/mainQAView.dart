import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/QAPage/questions.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';

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
              ),
              SelectableText(
                "KCSに関して多く寄せられる疑問をまとめました。",
                style: BaseTextStyles.plain,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: Questions.getList.getRange(0, 3).map((qa) {
                    return Text("Q. ${qa.question}", style: BaseTextStyles.qasummary,);
                  }).toList(),
                ),
              ),
              RaisedButton(
                color: Color(0x1cffffff),
                onPressed: () {
                  Navigator.of(context).pushNamed("/questions");
                },
                child: ListTile(
                  title: Text("全ての質問を見る", style: BaseTextStyles.button,),
                  trailing: Icon(Icons.open_in_new, color: Color(0x99ffffff),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}