import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';

class MainFooter extends StatelessWidget {
  final DeviceInfo deviceInfo;

  MainFooter({Key key, this.deviceInfo}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x24FFFFFF),
      width: deviceInfo.size.width,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: deviceInfo.device == Device.PC
            ? Column(
              children: <Widget>[
                Wrap(
                direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: <Widget>[
                    Container(child: kcsInfo(), width: 250,),
                    Container(child: siteMap(context), width: 250,),
                    Container(child: credit(), width: 250,)
                  ],
                ),
                copyRight()
              ],
            )
              : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /*
                ExpandablePanel(
                  header: Text(
                    "サイトマップ",
                    style: BaseTextStyles.h4,
                  ),
                  expanded: siteMap(),
                  theme: ExpandableThemeData(
                    hasIcon: true,
                    tapHeaderToExpand: true,
                    iconColor: Colors.white,
                    iconSize: 30.0,
                  ),
                ),*/
                siteMap(context),
                Divider(color: Color(0x61ffffff), thickness: 2,),
                credit(),
                Divider(color: Color(0x61ffffff), thickness: 2,),
                kcsInfo(),
                copyRight()
              ],
            ),
        )
      ),
    );
  }

  Widget kcsInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset("image/kcslogo.png", width: 200,),
        Text("Keio Computer Society", style: BaseTextStyles.plain,),
        Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                        child: Image.asset("image/twitterlogo.png", height: 48,)
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("@kcs1959", style: BaseTextStyles.plain,),
                  ),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      child: Image.asset("image/githublogo.png", height: 48,),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("github.com/kcs1959", style: BaseTextStyles.plain,),
                  ),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      child: Image.asset("image/kcsdragonlogo.png", height: 48,),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("kcs1959.jp", style: BaseTextStyles.plain,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget siteMap(context) {
    return Column(
      children: <Widget>[
        Text(
          "サイトマップ",
          style: BaseTextStyles.h4,
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/main");
          },
          child: Text("Top", style: BaseTextStyles.button,),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/groups");
          },
          child: Text("班紹介", style: BaseTextStyles.button,),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/schedule");
          },
          child: Text("年間スケジュール", style: BaseTextStyles.button,),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/character");
          },
          child: Text("キャラクター紹介", style: BaseTextStyles.button,),
        ),
        FlatButton(
          onPressed: null,
          child: Text("新歓情報", style: BaseTextStyles.button,),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/works");
          },
          child: Text("作品集", style: BaseTextStyles.button,),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/questions");
          },
          child: Text("よくある質問", style: BaseTextStyles.button,),
        ),
      ],
    );
  }

  Widget credit() {
    return Column(
      children: <Widget>[
        Text(
          "Credit",
          style: BaseTextStyles.h4,
        ),
        Image.asset("image/fastlogo.png", height: 100,),
        Text("Fastriver_org", style: BaseTextStyles.plain,),
        Text("Coding/Design", style: BaseTextStyles.subtitle1,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("image/orfevrelogo.jpg", height: 84,),
        ),
        Text("Yuuki Hyodo", style: BaseTextStyles.plain,),
        Text("Design/Image", style: BaseTextStyles.subtitle1,),
      ],
    );
  }

  Widget copyRight() {
    return Padding(
      padding: EdgeInsets.all(8.0),
        child: Text("©2020 KCS::Keio Computer Society", style: BaseTextStyles.subtitle1,)
    );
  }
}