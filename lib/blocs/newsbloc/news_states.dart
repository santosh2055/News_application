import 'package:equatable/equatable.dart';
import '../../models/article_model.dart';

class NewsStates extends Equatable {
  const NewsStates();

  @override
  List<Object> get props => [];
}



//for fetch state
class NewsInitState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsLoadedState extends NewsStates {
  final List<ArticleModel> articleList;
  const NewsLoadedState({required this.articleList});
}

class NewsErrorState extends NewsStates {
  final String errorMessage;
  const NewsErrorState({required this.errorMessage});
}

//for serch state

// class NewsSearchInitState extends NewsStates {}

// class NewsSearchLoadedState extends NewsInitState {
//   final List<ArticleModel> serchArticleList;
//   NewsSearchLoadedState({required this.serchArticleList});
// }

// class NewsSearchErrorState extends NewsStates {
//   final String errorMessage;
//   const NewsSearchErrorState({required this.errorMessage});
// }
