import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:responsive_grid/responsive_grid.dart';

class MainWorksView extends StatelessWidget {
  final DeviceInfo deviceInfo;

  MainWorksView({Key key, this.deviceInfo}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff121212),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: deviceInfo.size.height * 4 / 3,
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("2019年度作品集", style: BaseTextStyles.h1(deviceInfo),),
              SelectableText(
                "2019年度に部員が制作した作品たちです。一部は三田祭などで展示を行いました。",
                style: BaseTextStyles.plain,
              ),
              ResponsiveGridRow(
                children: works.map((work) {
                  return ResponsiveGridCol(
                    sm: 12, md: 6, lg: 4,
                    child: deviceInfo.device == Device.PC
                        ? workCard(work)
                        : workCardForMobile(work),
                  );
                }).toList(),
              ),
              RaisedButton(
                color: Color(0x1cffffff),
                onPressed: () {
                  Navigator.of(context).pushNamed("/works");
                },
                child: ListTile(
                    title: Text("全ての作品を見る", style: BaseTextStyles.button,),
                    trailing: Icon(Icons.open_in_new, color: Color(0x99ffffff),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget workCard(WorkInfo info) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0x17ffffff),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(info.title, style: BaseTextStyles.h4,),
              subtitle: Text(info.summary, style: BaseTextStyles.subtitle1,),
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: info.genres.map((genre) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
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
            Image.asset(info.image, height: 200, width: double.infinity, fit: BoxFit.cover,)
          ],
        ),
      ),
    );
  }

  Widget workCardForMobile(WorkInfo info) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        color: Color(0x17ffffff),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(info.title, style: BaseTextStyles.h4,),
                    subtitle: Text(info.summary, style: BaseTextStyles.subtitle1,),
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: info.genres.map((genre) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
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
                ],
              ),
            ),
            Image.asset(info.image, fit: BoxFit.fitHeight,)
          ],
        ),
      ),
    );
  }
}

var works = <WorkInfo>[
  WorkInfo("つらたん", "つらいときにやるゲーム", "image/tsuratan.png", <WorkGenre>[WorkGenre.WEB, WorkGenre.GAME]),
  //WorkInfo("クラタン", "スマホで自作の単語帳", "image/uzuka_rough.jpg", <WorkGenre>[WorkGenre.WEB, WorkGenre.TOOL]),
  //WorkInfo("年賀状", "出す気がない", "image/uzuka_rough.jpg", <WorkGenre>[WorkGenre.WEB, WorkGenre.GAME]),
  WorkInfo("BEYOND THE LIMIT", "レジェンド先生作", "image/beyondthelimit.png", <WorkGenre>[WorkGenre.UNITY, WorkGenre.GAME, WorkGenre.BLENDER]),
  //WorkInfo("接待オセロ", "人にやさしいAI", "image/uzuka_rough.jpg", <WorkGenre>[WorkGenre.WEB, WorkGenre.GAME, WorkGenre.AI]),
  WorkInfo("熱盛", "三田祭で大人気！", "image/atsumori.png", <WorkGenre>[WorkGenre.UNITY, WorkGenre.GAME]),
];

class WorkInfo {
  final String title;
  final String summary;
  final String image;
  final List<WorkGenre> genres;

  WorkInfo(this.title, this.summary, this.image, this.genres)
    : assert(title != null),
      assert(summary != null),
      assert(genres != null);
}

enum WorkGenre {
  WEB, AI, UNITY, BLENDER, DTM, OTHERS,
  STUDY, GAME, TOOL
}

extension WorkGenreExtension on WorkGenre {
  String getString() {
    switch(this) {
      case WorkGenre.WEB:
        return "Web";
      case WorkGenre.AI:
        return "AI";
      case WorkGenre.UNITY:
        return "Unity";
      case WorkGenre.BLENDER:
        return "Blender";
      case WorkGenre.DTM:
        return "DTM";
      case WorkGenre.OTHERS:
        return "Others";
      case WorkGenre.STUDY:
        return "Study";
      case WorkGenre.GAME:
        return "Game";
      case WorkGenre.TOOL:
        return "Tool";
      default:
        return this.toString().substring(10);
    }
  }
}
