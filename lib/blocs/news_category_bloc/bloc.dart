import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news_category_bloc/event.dart';
import 'package:news_app/blocs/news_category_bloc/state.dart';
import 'package:news_app/repositories/news_repository.dart';

import '../../models/article_model.dart';


class SearchBloc extends Bloc<SearchEvent, SearchStates> {
  // final String query;
  SerchRepositry serchRepositry;
  SearchBloc( {required SearchStates initialState, required this.serchRepositry})
      : super(initialState) {
    add(Search(query: ''));
  }

  @override
  Stream<SearchStates> mapEventToState(SearchEvent event) async* {
   
      if (event is SearchEvent) {
      try {
        List<ArticleModel> serchArticleList = [];
        yield NewsSearchInitState();
        serchArticleList =
            (await serchRepositry.fetchCategoryNews(event.query.toString()))!;

        yield NewsSearchLoadedState(serchArticleList: serchArticleList);
      } catch (e) {
        yield NewsSearchErrorState(errorMessage: e.toString());
      }
    }
  }
}