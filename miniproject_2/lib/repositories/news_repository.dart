import 'dart:convert';
import 'package:miniproject_2/models/article.dart';
import 'package:http/http.dart' as http;
import 'package:miniproject_2/models/article.dart';
import 'dart:convert';

class NewsRepository {
  Future<List<Article>> fetchNews() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=ab3b6086568c4c00ad6c843bf2aa2cf5"));

    var data = jsonDecode(response.body);

    List<Article> _articleModelList = [];

    if (response.statusCode == 200) {
      for (var item in data["articles"]) {
        Article _artcile = Article.fromJson(item);
        _articleModelList.add(_artcile);
      }
      return _articleModelList;
    } else {
      return _articleModelList;
    }
  }
}
