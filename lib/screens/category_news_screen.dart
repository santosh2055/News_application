import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/news_category_bloc/bloc.dart';
import '../blocs/news_category_bloc/state.dart';
import '../components/news_tile.dart';
import '../models/article_model.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;

  CategoryNews({required this.newsCategory});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  Widget build(BuildContext context) {
    final newsBloc = BlocProvider.of<SearchBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Flutter",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(
                  Icons.share,
                )),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SearchBloc, SearchStates>(
          builder: (context, state) {
            log('dddddd${state.props}}');
            if (state is NewsSearchInitState) {
              const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewsSearchLoadedState) {
              List<ArticleModel> serchArticleList = [];

              serchArticleList = state.serchArticleList;
              return Container(
                margin: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: serchArticleList.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsTile(
                        imgUrl: serchArticleList[index].urlToImage ?? "",
                        title: serchArticleList[index].title ?? "",
                        desc: serchArticleList[index].description ?? "",
                        content: serchArticleList[index].content ?? "",
                        posturl: serchArticleList[index].url ?? "",
                      );
                    }),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
