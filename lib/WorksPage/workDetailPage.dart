import 'dart:html';

import 'package:easy_web_view/easy_web_view.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/workDetailLayout.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/workInfo.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/works.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/mainWorksView.dart';
import 'package:kcs_2020_shinkan_web/util/link.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class WorkDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WorkDetailPageState();
}

class WorkDetailPageState extends State<WorkDetailPage> {
  static const routeName = "/works/detail";
  var embedHtml;

  PageController _pageViewController;
  DeviceInfo deviceInfo;

  @override
  void initState() {
    super.initState();
    analytics().logEvent("PAGE_WORKS_DETAIL", null);

    _pageViewController = PageController();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final WorkInfo args = ModalRoute.of(context).settings.arguments
      ?? WorksData.random();

    return Scaffold(
      backgroundColor: Color(0x80000000),
      body: InkWell(
        onTap: () {
          setState(() {
            embedHtml = "";
          });
          Navigator.of(context).pop();
        },
        child: LayoutBuilder(
            builder: (context, boxConstraint) {
              deviceInfo = DeviceInfo.measure(boxConstraint.biggest);
              return WorkDetailLayout(
                heroTag: "hoge",
                color: Color(0xFF121212),
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16/9,
                    child: args.embed != null
                        ? Align(
                          alignment: Alignment.center,
                          child: Builder(
                            builder: (context) {
                              embedHtml = args.embed;
                              return EasyWebView(
                                src: embedHtml,
                                isHtml: true,
                                webAllowFullScreen: false,
                              );
                            }
                          ),
                        )
                        : args.image.length == 0 ? Center(child: Text("No Image", style: BaseTextStyles.plain,).safeText(),) : Stack(
                          children: <Widget>[
                            PageView(
                              controller: _pageViewController,
                              children: args.image.mapIndexed((index, item) {
                                if(index == 0) {
                                  return Hero(
                                    tag: args.head,
                                    child: Image.asset(item),
                                  );
                                }
                                else return Image.asset(item);
                              })
                            ),
                            Positioned(
                            top: 0, bottom: 0, left: 0,
                            child: ButtonTheme(
                            minWidth: 20,
                            child: FlatButton(
                              onPressed: () {
                                var currentPage = (_pageViewController.page + 0.5).floor();
                                if(currentPage < 1) return;
                                _pageViewController.animateToPage(
                                    currentPage - 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut
                                );
                              },
                              color: Colors.white24,
                              child: Icon(Icons.chevron_left, color: Color(0xFF121212),),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0, bottom: 0, right: 0,
                          child: ButtonTheme(
                            minWidth: 20,
                            child: FlatButton(
                              onPressed: () {
                                var currentPage = (_pageViewController.page + 0.5).floor();
                                if(currentPage >= args.image.length) return;
                                _pageViewController.animateToPage(
                                    currentPage + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut
                                );
                              },
                              color: Colors.white24,
                              child: Icon(Icons.chevron_right, color: Color(0xFF121212),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      args.title,
                      style: BaseTextStyles.h1(deviceInfo),
                      textAlign: TextAlign.center,
                    ).safeText(),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: args.genres.map((genre) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Chip(
                            backgroundColor: Color(0xFF121212),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                side: BorderSide(width: 1.0, color: Color(0xFFaaaaaa))
                            ),
                            label: Text(genre.getString(), style: BaseTextStyles.subtitle1,).safeText()
                        ),
                      );
                    }).toList(),
                  ),
                  Builder(
                    builder: (context) {
                      String content = "";
                      if(args.author != null) content += "作者: " + args.author + "\n";
                      if(args.faculty != null) content += "${args.faculty}\n";
                      if(args.comment != null) content += args.comment + "\n";
                      if(args.tool != null) content += "使用ツール: " + args.tool + "\n";
                      if(args.language != null) content += "言語: " + args.language + "\n";
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(content, style: BaseTextStyles.plain, textAlign: TextAlign.center,).safeText(),
                      );
                    },
                  ),
                  args.link == null ? Container(): RaisedButton(
                    onPressed: () {
                      Link.shareFree(args.link);
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: Text("作品を見る", style: BaseTextStyles.button,).safeText(),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      Link.shareTwitter("「${args.title}」 -KCS新歓2020 作品集 \n https://kcs1959.github.io/2020new/#/works/detail?id=${args.id}");
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: Text("Tweet!", style: BaseTextStyles.button).safeText(),
                  ),
                  RaisedButton(
                    color: Color(0xDEFFFFFF),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: Text("閉じる", style: BaseTextStyles.buttonTint(tint: Color(0xFF121212)),).safeText(),
                  )
                ],
              );
            }
        ),
      ),
    );
  }
}

extension MyList<E, T> on List<T> {
  //https://stackoverflow.com/questions/54898767/enumerate-or-map-through-a-list-with-index-and-value-in-dart のやつを拡張関数に書き換えたやつ
  List<E> mapIndexed<E>(E Function(int index, T item) f) {
    var index = 0;
    var ret = List<E>();

    for (final item in this) {
      ret.add(f(index, item));
      index = index + 1;
    }
    return ret;
  }

  List<T> nonNull() {
    return this.where((t) => t != null).toList();
  }
}
