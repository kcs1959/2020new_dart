import 'package:flutter/cupertino.dart';

class FastNavigator {
  static final FastNavigator _fastNavigator = FastNavigator._internal();
  FastNavigator._internal();
  factory FastNavigator() => _fastNavigator;

  RouteFactory onGenerateRoute;
  Map<String, WidgetBuilder> routes;

  void init(Map<String, WidgetBuilder> route) {
    routes = route;
  }

  void pushNamed(
      NavigatorState navigatorState,
      RouteSettings settings,
      bool opaque) {
    navigatorState.push(PageRouteBuilder(
      pageBuilder: (context,__,___) => routes[settings.name](context),
      settings: settings,
      opaque: opaque
    ));
  }
}

/*
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_,__,___) => new GroupAIPage(),
                        settings: RouteSettings(name: "/groups/ai"),
                        opaque: false
                      ));
 */