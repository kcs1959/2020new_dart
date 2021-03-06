import 'package:fb_auth/fb_auth.dart';
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
        "/character": (_) => new CharacterPage(),
        "/schedule":  (_) => new SchedulePage(),
        "/editorialNote": (_) => new EditorialNotePage()
      },
      onGenerateRoute: (settings, routes) {
        print("path: ${settings.name}");

        var exp = new RegExp(r'^/groups/.+$');

        if(exp.hasMatch(settings.name ?? "")) {
          return MaterialPageRoute(
            settings: RouteSettings(
              name: "/groups",
              arguments: NavigateGroupsArgument(settings.name.substring(7)),
            ),
            builder: (_) => new GroupPage()
          );
        }

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
        home: MainPage()
    );
  }
}
