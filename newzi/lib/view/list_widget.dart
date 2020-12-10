import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newzi/model/news.dart';
import 'package:newzi/view_models/news_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';

class GeneralNewsList extends StatefulWidget {
  @override
  _GeneralNewsListState createState() => _GeneralNewsListState();
}

class _GeneralNewsListState extends State<GeneralNewsList> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<NewsViewModel>(context, listen: false).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    NewsViewModel newsViewModel =
        Provider.of<NewsViewModel>(context, listen: false);

    return Center(
      child: FutureBuilder(
          future: newsViewModel.newsList,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData)
              return CircularProgressIndicator();
            else if (snapshot.hasError)
              return Text(snapshot.error);
            else {
              List<News> news = snapshot.data;
              return ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: news.length,
                itemBuilder: (context, index) {
                  News article = news[index];
                  return GestureDetector(
                    onTap: () async => _launchURL(article.url),
                    child: Container(
                        child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: article.urlToImage == null
                                  ? 'https://images.app.goo.gl/gU76WVZGG2x8my678'
                                  : article.urlToImage,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              article.title == null ? "" : article.title,
                              style: titleStyle,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              article.description == null
                                  ? ""
                                  : article.description,
                              style: descriptionStyle,
                            ),
                          ],
                        ),
                      ),
                    )),
                  );
                },
              );
            }
          }),
    );
  }
}
