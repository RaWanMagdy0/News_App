import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'api_const.dart';

class ApiManager {
  ApiManager._();

  ///private constructor
  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  /// singlton pattern

  static Future<SourceResponse> getSources(String categoryId) async {
    Uri url = Uri.https(ApiCosnt.baseUrl, ApiCosnt.sourceApi,
        {"apiKey": "c5326ff1efd44e41996c18c313c7c5ab", "category": categoryId});
    try {
      var response = await http.get(url);
      var bodystring = response.body;
      var json = jsonDecode(bodystring);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=c5326ff1efd44e41996c18c313c7c5ab
    Uri url = Uri.https(ApiCosnt.baseUrl, ApiCosnt.newsApi,
        {"apiKey": "c5326ff1efd44e41996c18c313c7c5ab", "sources": sourceId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
  static Future<NewsResponse> searchNews(String query) async {
    Uri url = Uri.https(ApiCosnt.baseUrl, ApiCosnt.newsApi,
        {"apiKey": "c5326ff1efd44e41996c18c313c7c5ab", "q": query});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
