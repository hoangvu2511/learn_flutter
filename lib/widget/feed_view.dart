import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/feature/feed.dart';
import 'package:flutter_app/widget/feed_item_potrait.dart';

import 'bottom_loader.dart';
import 'feed_item.dart';

class GridViewFeed extends StatelessWidget {
  final List feeds;
  final ScrollController scrollController;
   
  GridViewFeed({this.feeds, this.scrollController});
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return index >= feeds.length
            ? BottomLoader()
            : FeedItemPortrait(item: Feed.fromMap(feeds[index]),);
      },
      itemCount: feeds.length,
      controller: scrollController,
    );
  }
}


class ListViewFeed extends StatelessWidget {
  final List feeds;
  final ScrollController scrollController;
  final bool hasReachedMax;

  ListViewFeed({this.feeds, this.scrollController, this.hasReachedMax});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return index >= feeds.length
            ? BottomLoader()
            : FeedItem(item: Feed.fromMap(feeds[index]),);
      },
      itemCount: hasReachedMax
          ? feeds.length
          : feeds.length + 1,
      controller: scrollController,
    );
  }
}
