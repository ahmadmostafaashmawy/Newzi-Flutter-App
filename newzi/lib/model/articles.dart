class Articles {
  final List<dynamic> articles;

  Articles({this.articles});

  factory Articles.fromJson(Map<String, dynamic> jsonData) =>
      Articles(articles: jsonData['articles']);
}
