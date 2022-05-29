import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/newsbloc/news_states.dart';
import '../../models/article_model.dart';
import '../../repositories/news_repository.dart';
import 'news_events.dart';

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
        List<ArticleModel> articleList = [];
        yield NewsLoadingState();
        articleList = (await newsRepositoty.fetchNews())!;

        yield NewsLoadedState(articleList: articleList);
      } catch (e) {
        yield NewsErrorState(errorMessage: e.toString());
      }
    } 
    // else if (event is SearchEvents) {
    //   try {
    //     List<ArticleModel> serchArticleList = [];
    //     yield NewsLoadingState();
    //     serchArticleList =
    //         (await newsRepositoty.fetchCategoryNews(event.query))!;

    //     yield NewsLoadedState(articleList: serchArticleList);
    //   } catch (e) {
    //     yield NewsErrorState(errorMessage: e.toString());
    //   }
    // }
  }
}


