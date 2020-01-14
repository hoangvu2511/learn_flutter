import 'package:flutter/material.dart';
import 'package:flutter_app/feature/feed_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'hello world',
            theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.white),
            home: Scaffold(
              appBar: AppBar(
                title: Text("abcd"),
                centerTitle: true,
              ),
                body: FeedPage(),
            ));
    }
}
