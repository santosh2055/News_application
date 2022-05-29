// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/news_category_bloc/bloc.dart';
import '../blocs/news_category_bloc/state.dart';
import '../components/news_tile.dart';
import '../models/article_model.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;

  const CategoryNews({Key? key, required this.newsCategory}) : super(key: key);

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.newsCategory,
              style: const TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            const Text(
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
              ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SearchBloc, SearchStates>(
          builder: (context, state) {
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
                        imgUrl: serchArticleList[index].urlToImage,
                        title: serchArticleList[index].title ?? "",
                        desc: serchArticleList[index].description ?? "",
                        content: serchArticleList[index].content ?? "",
                        posturl: serchArticleList[index].url ?? "",
                      );
                    }),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
