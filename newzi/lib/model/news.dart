class News {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  bool isFavorite;

  News(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.isFavorite = false});

  factory News.fromJson(Map<String, dynamic> jsonData) => News(
      title: jsonData['title'],
      author: jsonData['author'],
      description: jsonData['description'],
      url: jsonData['url'],
      urlToImage: jsonData['urlToImage']);
}
