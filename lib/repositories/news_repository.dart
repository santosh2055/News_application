import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class NewsRepository {
  String url =
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=2487b0d2eeb14f6baae57be6742abb44';

  Future<List<ArticleModel>?> fetchNews() async {
    try {
      var response = await http.get(
        Uri.parse(url),
      );
      var data = jsonDecode(response.body);
      List<ArticleModel> articleModelList = [];
      if (response.statusCode == 200) {
        for (var item in data["articles"]) {
          ArticleModel artcileModel = ArticleModel.fromJson(item);
          articleModelList.add(artcileModel);
        }
        return articleModelList;
      } else {
        return articleModelList; // empty list
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  
}

class SerchRepositry{
  Future<List<ArticleModel>?> fetchCategoryNews(String category) async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=2487b0d2eeb14f6baae57be6742abb44"),
      );
      var data = jsonDecode(response.body);
      // log('ddddgjjgjg${response.request}');

      List<ArticleModel> categoryNews = [];
      if (response.statusCode == 200) {
        for (var item in data["articles"]) {
          ArticleModel artcileModel = ArticleModel.fromJson(item);
          categoryNews.add(artcileModel);
        }
        return categoryNews;
      } else {
        return categoryNews; // empty list
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}