import 'package:tugas_mingguan6/post.dart';

abstract class PostState {}

class InitialPostState extends PostState {}

class PostsLoadedState extends PostState {
  final List<Post> posts;

  PostsLoadedState(this.posts);
}

class PostsLoadingErrorState extends PostState {
  final String errorMessage;

  PostsLoadingErrorState(this.errorMessage);
}