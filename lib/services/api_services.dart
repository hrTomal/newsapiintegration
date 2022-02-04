import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learningapiconnection/models/newsInfo.dart';
import '../constants/stringConstants.dart';

class API_services {
  Future<NewsModel> getNewsData() async {
    var newsModel = null;
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(StringConstants.newsAPI),
      );

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {}
    return newsModel;
  }
}
