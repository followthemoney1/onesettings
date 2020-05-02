import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttergoogleask/view/home/home_view.dart';
import 'package:fluttergoogleask/view/router.gr.dart';
import 'package:provider/provider.dart';
import 'package:stacked/_base_viewmodels.dart';
import 'package:stacked/_viewmodel_builder.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
         ChangeNotifierProvider<BaseViewModel>(create:(_) => BaseViewModel()),//MARK: provide base view model
        // Provider<Args>(create: (_) => Args()),
    ],
    child:MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      initialRoute: Routes.homeRoute,
//      onGenerateRoute: Router().onGenerateRoute,
        builder: ExtendedNavigator<Router>(router: Router()),
        // ExtendedNavigator is just a widget so you can still wrap it with other widgets
//        child: ExtendedNavigator<Router>(router: Router())
    ));
  }
}
