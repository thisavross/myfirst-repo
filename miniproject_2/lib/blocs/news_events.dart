import 'package:equatable/equatable.dart';
import 'package:miniproject_2/blocs/news_bloc.dart';
import 'package:miniproject_2/blocs/news_events.dart';
import 'package:miniproject_2/blocs/news_state.dart';

abstract class NewsEvents extends Equatable {
  const NewsEvents();

  @override
  List<Object> get props => [];
}

class StartEvent extends NewsEvents {}
