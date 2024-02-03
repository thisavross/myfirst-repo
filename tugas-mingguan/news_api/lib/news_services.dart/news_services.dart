import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_api/models/news_org_model.dart';

class NewsServices {
  Future<List<NewsOrgModel>> getNews() async {
    String baseUrl = "https://newsapi.org/v2/everything";
    Map<String, String> queryParams = {
      'q': 'tesla',
      'from': '2024-01-27',
      'to': '2024-01-27',
      'sortBy': 'popularity',
      'apikey': 'bdf47260604e4a08af6601d907bd23ff',
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
