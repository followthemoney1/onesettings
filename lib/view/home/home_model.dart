import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergoogleask/data/network/GoogleSearchResponse.dart';
import 'package:fluttergoogleask/host/services/api.dart';
import 'package:fluttergoogleask/locator.dart';
import 'package:stacked/_base_viewmodels.dart';
import '../router.gr.dart';

class HomeViewModel extends BaseViewModel {
  Api _api = locator<Api>();
  TextEditingController googleTextController = TextEditingController();
  int counter = 0;

  void initialise() {
    //Your initialization
    notifyListeners();
  }

  void updateTitle() async {
    setBusy(true);
    counter++;
    googleTextController.text = counter.toString();
    await Future.delayed(Duration(seconds: 1), null);
    setBusy(false);
    notifyListeners();
  }

  void searchResult()async {
    setBusy(true);
    GoogleSearchResponse googleSearchResponse = await _api.getSearchResult(googleTextController.text);
    setBusy(false);

    if(googleSearchResponse.items.length>0){
      ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.searchRoute);
    }
    notifyListeners();
  }
}
