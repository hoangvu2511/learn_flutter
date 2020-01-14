import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/feature/feed_detail.dart';
import 'package:flutter_app/feature/more_anime_manga.dart';

import 'feature/type.dart';
import 'model/feature/feed.dart';

gotoDetailScreen(Feed item, BuildContext context) {
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