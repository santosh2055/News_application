import 'package:news_app/screens/home_screen.dart';


// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2487b0d2eeb14f6baae57be6742abb44
const apiKey = '2487b0d2eeb14f6baae57be6742abb44';
const baseUrl = 'https://newsapi.org/v2/top-headlines?country=us';

class Urlist {
  final fetchNews = "$baseUrl&category=technology&apiKey=$apiKey";
}
