import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/blocs/newsbloc/news_bloc.dart';
import 'package:news_app/utils/themes/app_theme.dart';

import '../blocs/news_category_bloc/bloc.dart';
import '../blocs/news_category_bloc/event.dart';
import '../blocs/newsbloc/news_states.dart';
import '../blocs/theme/themek_bloc.dart';
import '../components/network_image.dart';
import '../components/news_tile.dart';
import '../models/article_model.dart';
import '../models/news_category_model.dart';
import '../utils/category_title_data.dart';
import 'category_news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<CategorieModel> categories = <CategorieModel>[];

class _HomeScreenState extends State<HomeScreen> {
  bool isdark = true;

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsBloc = BlocProvider.of<SearchBloc>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: const Color(0xFFf6501c),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'News',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "APP",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              )
            ],
          ),
          actions: [
            Switch(
              activeColor: Colors.white,
              value: isdark,
              onChanged: (val) async {
                setState(() {
                  _setTheme(
                    val,
                  );
                });

                isdark = !isdark;
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          newsBloc.add(Search(
                              query:
                                  categories[index].categorieName.toString()));

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryNews(
                                newsCategory:
                                    categories[index].categorieName.toString(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 14),
                          child: Stack(
                            children: <Widget>[
                              displayNetworkImageWithErrorControl(
                                  imageHeight: 100,
                                  imageName: categories[index]
                                      .imageAssetUrl
                                      .toString(),
                                  fit: BoxFit.cover),
                              Container(
                                alignment: Alignment.center,
                                height: 90,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black26),
                                child: Text(
                                  categories[index].categorieName.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              BlocBuilder<NewsBloc, NewsStates>(
                builder: (BuildContext context, NewsStates state) {
                  if (state is NewsLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NewsLoadedState) {
                    List<ArticleModel> articleList = [];

                    articleList = state.articleList;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: articleList.length,
                      itemBuilder: (context, index) => NewsTile(
                        imgUrl: articleList[index].urlToImage,
                        title: articleList[index].title ?? "",
                        desc: articleList[index].description ?? "",
                        content: articleList[index].content ?? "",
                        posturl: articleList[index].url ?? "",
                      ),
                    );
                  } else if (state is NewsErrorState) {
                    // String error = state.errorMessage;

                    return const Center(
                      child: Text('Ops Something went Wrong'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _setTheme(bool darkTheme) async {
    AppTheme selectedTheme =
        darkTheme ? AppTheme.lightTheme : AppTheme.darkTheme;
    context.read<ThemekBloc>().add(ThemekEvent(appTheme: selectedTheme));
  }
}
