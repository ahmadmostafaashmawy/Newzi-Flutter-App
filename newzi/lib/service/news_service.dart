import 'dart:convert';

import 'package:newzi/model/news.dart';
import 'package:http/http.dart' as http;
import 'package:newzi/model/articles.dart';

const String apiKey = '00fca994d1b24779b108562680e06472';
const String baseUrl = 'https://newsapi.org/';
const String topHeadlines = 'v2/top-headlines/';

class NewsApi {
  Future<List<News>> fetchArticles({String country, String category}) async {
    try {
      http.Response response =
          await http.get('$baseUrl$topHeadlines?category=$category&country=$country&apiKey=$apiKey');
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromJson(jsonData);
        List<News> news =
            articles.articles.map((newsObj) => News.fromJson(newsObj)).toList();

        return news;
      } else {
        print('Status code=${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }
}
