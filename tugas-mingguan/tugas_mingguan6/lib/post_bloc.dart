import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:tugas_mingguan6/post_event.dart';
import 'package:tugas_mingguan6/post_state.dart';
import 'package:tugas_mingguan6/post.dart';
import 'package:http/http.dart' as http;

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(InitialPostState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is LoadPosts) {
      yield PostLoadingState();

      try {
        final response = await http
            .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

        if (response.statusCode == 200) {
          final List<dynamic> jsonBody = json.decode(response.body);
          final List<Post> posts =
              jsonBody.map((json) => Post.fromJson(json)).toList();

          yield PostsLoadedState(posts);
        } else {
          yield PostsLoadingErrorState('Failed to load posts');
        }
      } catch (e) {
        yield PostsLoadingErrorState('Failed to load posts: $e');
      }
    }
  }
}

class PostLoadingState extends PostState{
}
