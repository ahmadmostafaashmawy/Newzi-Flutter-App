import 'package:flutter/cupertino.dart';
import 'package:newzi/model/news.dart';
import 'package:newzi/service/news_service.dart';

class NewsViewModel extends ChangeNotifier {
  String selectedCountry = 'eg';
  String selectedCategory = 'general';

  Future<List<News>> _newsList;
  NewsApi _newsApi = NewsApi();

  Future<void> fetchNews() async {
    _newsList = _newsApi.fetchArticles(
        country: selectedCountry, category: selectedCategory);
    notifyListeners();
  }

  Future<List<News>> get newsList => _newsList;

  void setCountry(String value) {
    selectedCountry = value;
    fetchNews();
  }

  void setCategory(String value) {
    selectedCategory = value;
    fetchNews();
  }
}
