import 'package:fb_auth/fb_auth.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kcs_2020_shinkan_web/CharacterPage/characterPage.dart';
import 'package:kcs_2020_shinkan_web/EditorialNotePage/editorialNotePage.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupAIPage.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupPage.dart';
import 'package:kcs_2020_shinkan_web/SchedulePage/schedulePage.dart';
import 'package:kcs_2020_shinkan_web/ShinkanPage/shinkanPage.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/workDetailPage.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/worksPage.dart';
import 'package:kcs_2020_shinkan_web/QAPage/qaPage.dart';
import 'package:kcs_2020_shinkan_web/initFirebase.dart';
import 'package:kcs_2020_shinkan_web/util/fastNavigator.dart';
import 'mainPage.dart';

void main() {
  //debugPaintLayerBordersEnabled = true;
  //debugRepaintRainbowEnabled = true;
  runApp(MyApp());

  initFirebase();
  
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

    FastNavigator().init(
      routes: {
        "/main" :     (_) => new MainPage(),
        "/questions": (_) => new QAPage(),
        "/works":     (_) => new WorksPage(),
        "/works/detail": (_) => new WorkDetailPage(),
        "/shinkan":   (_) => new ShinkanPage(),
        "/groups":    (_) => new GroupPage(),
        "/groups/ai": (_) => new GroupAIPage(),
        "/character": (_) => new CharacterPage(),
        "/schedule":  (_) => new SchedulePage(),
        "/editorialNote": (_) => new EditorialNotePage()
      },
      onGenerateRoute: (settings, routes) {
        print("path: ${settings.name}");

        var paths = settings.name.split('?');
        if(paths.length == 2){
          if(paths[0] == "/works/detail") {
            var queryParameters = Uri.splitQueryString(paths[1]);
            if(queryParameters.containsKey("id")) {
              return MaterialPageRoute(
                  settings: RouteSettings(
                    name: "/works",
                    arguments: NavigateWorksArgument(queryParameters["id"])
                  ),
                  builder: (_) => new WorksPage()
              );
            }
          }
          return null;
          /*var queryParameters = Uri.splitQueryString(paths[1]);
          print("param: ${paths[1]}");
          if(queryParameters.containsKey("id")){
            id = queryParameters["id"];
          }

          if(paths[0] == "/"){
            return MaterialPageRoute(
              settings: RouteSettings(name: settings.name), // これによりURLが変わる
              builder: (context) {
                //return new MyHomePage(title: "fuga",);
                return MultiProvider(
                  providers: [
                    Provider<MainViewModel>.value(value: MainViewModel()),
                    Provider<UserViewModel>.value(value: UserViewModel()),
                  ],
                  child: MainTabbarPage(linkedId: id,),
                );
              },
            );
          }
          else {
            return null;
          }*/
        }
        else {
          return null;
        }
      }
    );
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
        onGenerateRoute: FastNavigator().getOnGenerateRoute,
        routes: FastNavigator().getRoutes,
        /*
      routes: {
        "/main" :     (_) => new MainPage(),
        "/questions": (_) => new QAPage(),
        "/works":     (_) => new WorksPage(),
        "/shinkan":   (_) => new ShinkanPage(),
        "/groups":    (_) => new GroupPage(),
        "/groups/ai": (_) => new GroupAIPage(),
        "/character": (_) => new CharacterPage(),
        "/schedule":  (_) => new SchedulePage()
      },*/
      home: MainPage()
    );
  }
}
