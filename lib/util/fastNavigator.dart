import 'package:flutter/material.dart';

class FastNavigator {
  static final FastNavigator _fastNavigator = FastNavigator._internal();
  FastNavigator._internal();
  factory FastNavigator() => _fastNavigator;

  RouteFactory _onGenerateRoute;
  Map<String, WidgetBuilder> _routes;

  RouteFactory get getOnGenerateRoute => _onGenerateRoute;
  Map<String, WidgetBuilder> get getRoutes => _routes;

  void init({@required Map<String, WidgetBuilder> routes, @required FastRouteFactory onGenerateRoute}) {
    _routes = routes;
    _onGenerateRoute = (settings) => onGenerateRoute(settings, routes);
  }

  void pushNamed(
      NavigatorState navigatorState,
      RouteSettings settings,
      bool opaque) {
    if(!_routes.containsKey(settings.name)) {
      print("${settings.name} is not found");
      return;
    }
    navigatorState.push(PageRouteBuilder(
      pageBuilder: (context,__,___) => _routes[settings.name](context),
      settings: settings,
      opaque: opaque
    ));
  }
}

typedef FastRouteFactory = Route<dynamic> Function(RouteSettings settings, Map<String, WidgetBuilder> routes);
