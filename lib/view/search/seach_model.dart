import 'package:flutter/widgets.dart';
import 'package:fluttergoogleask/data/network/GoogleSearchResponse.dart';
import 'package:fluttergoogleask/host/services/api.dart';
import 'package:fluttergoogleask/locator.dart';
import 'package:stacked/_base_viewmodels.dart';

class SearchViewModel extends BaseViewModel {
  Api _api = locator<Api>();
  GoogleSearchResponse googleSearchResponse;
  void initialise() {
    googleSearchResponse = _api.searchResult;
    notifyListeners();
  }


}