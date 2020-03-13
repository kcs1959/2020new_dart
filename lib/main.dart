import 'package:fb_auth/fb_auth.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kcs_2020_shinkan_web/CharacterPage/characterPage.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupAIPage.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupPage.dart';
import 'package:kcs_2020_shinkan_web/SchedulePage/schedulePage.dart';
import 'package:kcs_2020_shinkan_web/ShinkanPage/shinkanPage.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/worksPage.dart';
import 'package:kcs_2020_shinkan_web/QAPage/qaPage.dart';
import 'mainPage.dart';

void main() async {
  await DotEnv().load('.env');
  //debugPaintLayerBordersEnabled = true;
  //debugRepaintRainbowEnabled = true;
  runApp(MyApp());

  initializeApp(
      apiKey: DotEnv().env["FIREBASE_API_KEY"],
      authDomain: "kcs2020new.firebaseapp.com",
      databaseURL: "https://kcs2020new.firebaseio.com",
      projectId: "kcs2020new",
      appId: DotEnv().env["FIREBASE_APP_ID"],
      measurementId: DotEnv().env["FIREBASE_MEASUREMENT_ID"],
      storageBucket: "kcs2020new.appspot.com",);
  
  //analytics();
  //FirebaseAuth.instance.signInAnonymously();
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _auth = AuthBloc(app: null);
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    _auth.add(LoginGuest());
  }

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
        "/groups/ai": (_) => new GroupAIPage(),
        "/character": (_) => new CharacterPage(),
        "/schedule":  (_) => new SchedulePage()
      },
      home: MainPage()
    );
  }
}
