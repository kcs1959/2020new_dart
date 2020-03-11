import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kcs_2020_shinkan_web/CharacterPage/characterPage.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupPage.dart';
import 'package:kcs_2020_shinkan_web/SchedulePage/schedulePage.dart';
import 'package:kcs_2020_shinkan_web/ShinkanPage/shinkanPage.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/worksPage.dart';
import 'package:kcs_2020_shinkan_web/QAPage/qaPage.dart';
import 'mainPage.dart';

void main() {
  //debugPaintLayerBordersEnabled = true;
  //debugRepaintRainbowEnabled = true;
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KCS::Keio Computer Society 新歓特設サイト',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Noto Sans JP",
      ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ja', 'JP'),
        ],
      routes: {
        "/main" :     (_) => new MainPage(),
        "/questions": (_) => new QAPage(),
        "/works":     (_) => new WorksPage(),
        "/shinkan":   (_) => new ShinkanPage(),
        "/groups":    (_) => new GroupPage(),
        "/character": (_) => new CharacterPage(),
        "/schedule":  (_) => new SchedulePage()
      },
      home: MainPage()
    );
  }
}
