import 'dart:convert';
import 'package:pengayaan11/materi11/model/album_model.dart';
import 'package:http/http.dart' as http;
import 'package:pengayaan11/materi11/model/list_album_model.dart';

class MateriServices {
  static Future<Album> fetchAlbum(int id) async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/$id"));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception("Failed to load album");
    }
  }

  static Future<List<Post>> getPosts() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1/photos");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    final List body = json.decode(response.body);

    return body.map((e) => Post.fromJson(e)).toList();
  }
}
