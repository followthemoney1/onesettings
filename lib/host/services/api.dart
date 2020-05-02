import 'dart:convert';

import 'package:fluttergoogleask/data/network/GoogleSearchResponse.dart';
import 'package:http/http.dart' as http;

class Api {
  static const endpoint = 'https://www.googleapis.com/customsearch/v1';
  var client = new http.Client();

  GoogleSearchResponse searchResult;

  Future<GoogleSearchResponse> getSearchResult(String search) async {
    // Get user profile for id
    var response = await client.get('$endpoint?key=AIzaSyC-2NtQvVPN0qfih08GT3Pp8lmwkRuw1Xg&cx=017576662512468239146:omuauf_lfve&q=$search');

    // Convert and return
    return searchResult = GoogleSearchResponse.fromJson(json.decode(response.body));
  }
}