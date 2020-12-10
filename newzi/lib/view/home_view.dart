import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:newzi/view_models/news_view_model.dart';
import 'package:provider/provider.dart';

import 'category_dialog.dart';
import 'countries_dialog.dart';
import 'list_widget.dart';

class HomeView extends StatefulWidget {
  static final String route = '/home';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Newzi',
          style: TextStyle(fontFamily: 'Lobster', fontSize: 30.0),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.emoji_flags),
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return CountryDialog(
                  onSelectedCountry: (value) {
                    setState(() {
                      Provider.of<NewsViewModel>(context, listen: false)
                          .setCountry(value);
                    });
                  },
                );
              }),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.category_outlined),
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CategoryDialog(
                    onSelectedCategory: (value) {
                      setState(() {
                        Provider.of<NewsViewModel>(context, listen: false)
                            .setCategory(value);
                      });
                    },
                  );
                }),
          ),
        ],
      ),
      body: GeneralNewsList(),
    );
  }
}
