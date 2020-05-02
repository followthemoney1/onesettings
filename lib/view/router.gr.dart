// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fluttergoogleask/view/home/home_view.dart';
import 'package:fluttergoogleask/view/search/search_view.dart';

abstract class Routes {
  static const homeRoute = '/';
  static const searchRoute = '/search-route';
}

class Router extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.searchRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SearchView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
