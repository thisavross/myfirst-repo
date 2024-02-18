import 'package:equatable/equatable.dart';
import 'package:miniproject_2/blocs/news_events.dart';
import 'package:miniproject_2/blocs/news_state.dart';
import 'package:miniproject_2/models/article.dart';
import 'package:miniproject_2/repositories/news_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  NewsRepository newsRepositoty;
  NewsBloc({required NewsStates initialState, required this.newsRepositoty})
      : super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<NewsStates> mapEventToState(NewsEvents event) async* {
    if (event is StartEvent) {
      try {
        List<Article> _articleList = [];
        yield NewsLoadingState();
        _articleList = await newsRepositoty.fetchNews();
        yield NewsLoadedState(articleList: _articleList);
      } catch (e) {
        List<dynamic> errorList = [e];
        yield NewsErrorListState(errorList: errorList);
      }
    }
  }
}
class NewsErrorListState extends NewsStates {
  final List<dynamic> errorList;

  const NewsErrorListState({required this.errorList});

  @override
  List<Object> get props => [errorList];
}
