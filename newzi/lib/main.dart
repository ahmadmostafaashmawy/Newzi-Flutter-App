import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newzi/view/home_view.dart';
import 'package:newzi/view_models/news_view_model.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsViewModel>(
      create: (context) => NewsViewModel(),
      child: MaterialApp(
        initialRoute: HomeView.route,
        routes: <String, WidgetBuilder>{
          HomeView.route: (context) => HomeView(),
        },
      ),
    );
  }
}
