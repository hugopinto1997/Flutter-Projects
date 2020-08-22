import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;


//final _baseUrl = 'https://newsapi.org/v2';
//final _apiKey = '0440c0669917421c8de9a275c8b1fcd5';
final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY   = '0440c0669917421c8de9a275c8b1fcd5';
class NewsService with ChangeNotifier{

  List<Article> headlines = [];

  NewsService(){
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
      print('a ver');
      final url ='$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=ca';
      final resp = await http.get(url);

      final newsResponse = newsResponseFromJson( resp.body );

      this.headlines.addAll( newsResponse.articles );
      notifyListeners();
  }

}