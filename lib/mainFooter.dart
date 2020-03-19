import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/ext/hover_extensions.dart';
import 'package:kcs_2020_shinkan_web/util/link.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class MainFooter extends StatelessWidget {
  DeviceInfo deviceInfo;
  Color tint;
  String shareText;

  MainFooter({Key key, this.deviceInfo, this.tint, this.shareText}): super(key: key);

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
                shareView(context, false),
                Divider(color: Color(0x38FFFFFF), thickness: 2.0,),
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
                shareView(context, true),
                Divider(color: Color(0x38ffffff), thickness: 2,),
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
        Text("Keio Computer Society", style: BaseTextStyles.plainTint(tint: tint),).safeText(),
        Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: Link.toTwitterKCS,
                child: Wrap(
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
                      child: Text("@kcs1959", style: BaseTextStyles.plainTint(tint: tint),).safeText(),
                    ),
                  ],
                ),
              ).showCursorOnHover,
              InkWell(
                onTap: Link.toGitHubKCS,
                child: Wrap(
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
                      child: Text("github.com/kcs1959", style: BaseTextStyles.plainTint(tint: tint),).safeText(),
                    ),
                  ],
                ),
              ).showCursorOnHover,
              InkWell(
                onTap: Link.toKCS1959,
                child: Wrap(
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
                      child: Text("kcs1959.jp", style: BaseTextStyles.plainTint(tint: tint),).safeText(),
                    ),
                  ],
                ),
              ).showCursorOnHover,
            ],
          ),
        ),
      ],
    );
  }

  Widget shareView(context, bool isMobile) {
    if(shareText == null) return Container();
    var children = [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: AutoSizeText(
          "ページをシェアしよう",
          style: BaseTextStyles.h4Tint(tint: tint),
        ).safeText(),
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              analytics().logEvent("SHARE_TWITTER", null);
              Link.shareTwitter(shareText);
            },
            child: Image.asset("image/twitterlogo.png", height: 40,),
          ).showCursorOnHover,
          InkWell(
            onTap: () {
              analytics().logEvent("SHARE_LINE", null);
              Link.shareLINE(shareText);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("image/linelogo.png", height: 24,),
            ),
          ).showCursorOnHover,
          InkWell(
              onTap: () {
                analytics().logEvent("SHARE_QR", null);
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Color(0xFF292929),
                        title: Text(
                          "共有する",
                          style: BaseTextStyles.h4,
                        ).safeText(),
                        content: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SelectableText(
                                          shareText,
                                          style: BaseTextStyles.plain,
                                        ),
                                      )
                                  ),
                                ],
                              ),
                              Image.network("https://chart.apis.google.com/chart?chs=450x450&cht=qr&chl=" + Uri.encodeComponent(shareText))
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          OutlineButton(
                              child: Text(
                                "閉じる",
                                style: BaseTextStyles.button,
                              ).safeText(),
                              onPressed: () => Navigator.pop(context)
                          ).showCursorOnHover
                        ],
                      );
                    }
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("image/icon_qrcode.png", height: 24,),
              )
          ).showCursorOnHover,
        ],
      ),
    ];
    return isMobile
        ? Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        )
        : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children
        );
  }

  Widget siteMap(context) {
    return Column(
      children: <Widget>[
        Text(
          "サイトマップ",
          style: BaseTextStyles.h4Tint(tint: tint),
        ).safeText(),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/main");
          },
          child: Text("Top", style: BaseTextStyles.buttonTint(tint: tint),).safeText(),
        ).showCursorOnHover,
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/groups");
          },
          child: Text("班紹介", style: BaseTextStyles.buttonTint(tint: tint),).safeText(),
        ).showCursorOnHover,
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/schedule");
          },
          child: Text("年間行事", style: BaseTextStyles.buttonTint(tint: tint),).safeText(),
        ).showCursorOnHover,
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/character");
          },
          child: Text("キャラクター紹介", style: BaseTextStyles.buttonTint(tint: tint),).safeText(),
        ).showCursorOnHover,
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/shinkan");
          },
          child: Text("新歓情報", style: BaseTextStyles.buttonTint(tint: tint),).safeText(),
        ).showCursorOnHover,
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/works");
          },
          child: Text("作品集", style: BaseTextStyles.buttonTint(tint: tint),).safeText(),
        ).showCursorOnHover,
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/questions");
          },
          child: Text("よくある質問", style: BaseTextStyles.buttonTint(tint: tint),).safeText(),
        ).showCursorOnHover,
      ],
    );
  }

  Widget credit() {
    return Column(
      children: <Widget>[
        Text(
          "Credit",
          style: BaseTextStyles.h4Tint(tint: tint),
        ),
        InkWell(
          onTap: Link.toTwitterFastriver,
          child: Column(
            children: <Widget>[
              Image.asset("image/fastlogo.png", height: 100,),
              Text("Fastriver_org", style: BaseTextStyles.plainTint(tint: tint),).safeText(),
              Text("Coding/Design", style: BaseTextStyles.subtitle1Tint(tint: tint),).safeText(),
            ],
          ),
        ).showCursorOnHover,
        InkWell(
          onTap: Link.toTwitterOrfevre,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("image/orfevrelogo.jpg", height: 84,),
              ),
              Text("Yuuki Hyodo", style: BaseTextStyles.plainTint(tint: tint),).safeText(),
              Text("Design/Image", style: BaseTextStyles.subtitle1Tint(tint: tint),).safeText(),
            ],
          ),
        ).showCursorOnHover,
      ],
    );
  }

  Widget copyRight() {
    return Padding(
      padding: EdgeInsets.all(8.0),
        child: Text("©2020 KCS::Keio Computer Society", style: BaseTextStyles.subtitle1Tint(tint: tint),).safeText()
    );
  }
}