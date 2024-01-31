import 'dart:convert';
import 'package:http/http.dart';
import 'package:pengayaan17/models/news_org_model.dart';

class NewsServices {
  Future<List<NewsOrgModel>> getNews() async {
    String baseUrl = "https://newsapi.org/v2/everything";
    Map<String, String> queryParams = {
      'q': 'apple',
      'from': '2024-01-27',
      'to': '2024-01-27',
      'sortBy': 'popularity',
      'apikey': 'c69173d515324c06b071c9cad44d0233',
    };
    String queryString = Uri(queryParameters: queryParams).query;

    String apiUrl = '$baseUrl?$queryString';

    Response response = await get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['articles'];
      print(result);
      return result.map((e) => NewsOrgModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
