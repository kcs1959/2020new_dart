import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/workDetailLayout.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/workInfo.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/works.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/mainWorksView.dart';
import 'package:kcs_2020_shinkan_web/util/link.dart';

class WorkDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WorkDetailPageState();
}

class WorkDetailPageState extends State<WorkDetailPage> {
  static const routeName = "/works/detail";

  PageController _pageViewController;
  DeviceInfo deviceInfo;

  @override
  void initState() {
    super.initState();

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

    Future(() {
      print(ModalRoute.of(context).overlayEntries);
    });

    return Scaffold(
      backgroundColor: Color(0x80000000),
      body: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: LayoutBuilder(
            builder: (context, boxConstraint) {
              deviceInfo = DeviceInfo.measure(boxConstraint.biggest);
              return WorkDetailLayout(
                heroTag: "HOGE",
                color: Color(0xFF121212),
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16/9,
                    child: args.image.length == 0 ? Center(child: Text("No Image", style: BaseTextStyles.plain,),) : Stack(
                      children: <Widget>[
                        PageView(
                            controller: _pageViewController,
                            children: args.image.map((e) => Image.asset(e)).toList()
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
                    ),
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
                            label: Text(genre.getString(), style: BaseTextStyles.subtitle1,)
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
                        child: Text(content, style: BaseTextStyles.plain, textAlign: TextAlign.center,),
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
                    child: Text("作品を見る", style: BaseTextStyles.button,),
                  ),
                  RaisedButton(
                    color: Color(0xDEFFFFFF),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: Text("閉じる", style: BaseTextStyles.buttonTint(tint: Color(0xFF121212)),),
                  )
                ],
              );
            }
        ),
      ),
    );
  }
}