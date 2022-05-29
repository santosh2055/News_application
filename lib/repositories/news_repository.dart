import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/constant.dart';
import '../models/article_model.dart';

class NewsRepository {
  String url = '';

  Future<List<ArticleModel>?> fetchNews() async {
    try {
      var response = await http.get(
        Uri.parse(Urlist().fetchNews),
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

class SerchRepositry {
  Future<List<ArticleModel>?> fetchCategoryNews(String category) async {
    try {
      var response = await http.get(
        Uri.parse('$baseUrl&category=$category&apiKey=$apiKey'),
      );
      var data = jsonDecode(response.body);
      log('ddrequestdd${response.request}');

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
