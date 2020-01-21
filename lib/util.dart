import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/feature/feed_detail.dart';
import 'package:flutter_app/feature/list_more/more_anime_manga.dart';

import 'feature/type.dart';
import 'model/feature/list_anime_response.dart';

gotoDetailScreen(ListAnimeResponse item, BuildContext context) {
  if (item.id != null) {
    Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => FeedDetailPage(),
          settings: RouteSettings(arguments: item)
      ),
    );
  }
}

gotoMoreAnime(BuildContext context, TypeAorM type) {
//  Navigator.of(context).push(
//      PageRouteBuilder(
//          pageBuilder: (context, animation, secondaryAnimation) => MoreAnimeManga(),
//          settings: RouteSettings(
//              arguments: type
//          )
//      )
//  );

  Navigator.push(context,
      MaterialPageRoute(
          builder: (context) => MoreAnimeManga(),
          settings: RouteSettings(
              arguments: type
          )
      ));
}

generateListYear(){
  var date = DateTime.now();
  var listYear = <String>[];
  for(var i = 1970; i <= date.year; i++){
    listYear.add("$i");
  }

  return listYear.reversed.toList();
}