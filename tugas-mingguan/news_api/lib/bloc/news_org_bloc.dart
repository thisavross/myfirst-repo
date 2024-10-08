import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_api/models/news_org_model.dart';
import 'package:news_api/news_services.dart/news_services.dart';

part 'news_org_state.dart';
part 'news_org_event.dart';

class NewsOrgBloc extends Bloc<NewsOrgEvent, NewsOrgState> {
  final NewsServices _newsServices;
  NewsOrgBloc(this._newsServices) : super(NewsOrgInitial()) {
    on<LoadNewsEvent>((event, emit) async {
      emit(NewsLoadingState());
      try {
        final news = await _newsServices.getNews();
        emit(NewsLoadedState(news));
      } catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    });
  }
}