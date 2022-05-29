import 'package:equatable/equatable.dart';

import '../../models/article_model.dart';

class SearchStates extends Equatable {
  const SearchStates();

  @override
  List<Object> get props => [];
}

class NewsSearchInitState extends SearchStates {}

class NewsSearchLoadedState extends SearchStates {
  final List<ArticleModel> serchArticleList;
  const NewsSearchLoadedState({required this.serchArticleList});
}

class NewsSearchErrorState extends SearchStates {
  final String errorMessage;
  const NewsSearchErrorState({required this.errorMessage});
}
