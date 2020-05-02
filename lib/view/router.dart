import 'package:auto_route/auto_route_annotations.dart';
import 'package:fluttergoogleask/view/home/home_view.dart';
import 'package:fluttergoogleask/view/search/search_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomeView homeRoute;
  SearchView searchRoute;
}