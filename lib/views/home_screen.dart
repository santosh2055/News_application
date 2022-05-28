import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:news_app/blocs/newsbloc/news_bloc.dart';

import '../blocs/newsbloc/news_states.dart';
import '../components/news_tile.dart';
import '../components/search_header.dart';
import '../models/article_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            BlocBuilder<NewsBloc, NewsStates>(
              builder: (BuildContext context, NewsStates state) {
                if (state is NewsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is NewsLoadedState) {
                  List<ArticleModel> _articleList = [];
                  _articleList = state.articleList;
                  return Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: _articleList.length,
                        itemBuilder: (context, index) => NewsTile(
                              imgUrl: _articleList[index].urlToImage ?? "",
                              title: _articleList[index].title ?? "",
                              desc: _articleList[index].description ?? "",
                              content: _articleList[index].content ?? "",
                              // posturl: _articleList[index].articleUrl ?? "",
                            )),
                  );
                } else if (state is NewsErrorState) {
                  String error = state.errorMessage;

                  return Center(child: Text(error));
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.green,
                  ));
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
