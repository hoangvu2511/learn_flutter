import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/feature/type.dart';
import 'package:flutter_app/util.dart';

class FeedItemMore extends StatelessWidget {
  final TypeAorM type;

  FeedItemMore({this.type});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        gotoMoreAnime(context, type);
      },
      child: Container(
        width: 224.0,
        height: 224.0,
        child: Card(
          clipBehavior: Clip.antiAlias,
          borderOnForeground: true,
          child: Center(
            child: Text("More"),
          ),
        ),
      ),
    );
  }
}
