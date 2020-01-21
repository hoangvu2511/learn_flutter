import 'package:flutter/cupertino.dart';
import 'package:flutter_app/feature/list_more/bloc/state.dart';
import 'package:flutter_app/feature/type.dart';
import 'package:flutter_app/model/feature/list_anime_response.dart';

import 'bottom_loader.dart';
import 'feed_item.dart';
import 'feed_item_potrait.dart';

class EndlessList extends StatefulWidget {
  final curState;
  final VoidCallback onEndScroll;
  final ListType type;

  EndlessList({this.curState, this.onEndScroll, this.type = ListType.LIST});

  @override
  _EndlessListState createState() => _EndlessListState();
}

class _EndlessListState extends State<EndlessList> {
  final ScrollController _scrollController = ScrollController();
  final _scrollThreshHold = 200.0;

  _EndlessListState() {
    _scrollController.addListener(_onScroll);
  }

  _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll < _scrollThreshHold && widget.curState is! Loading) {
      widget.onEndScroll?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.type == ListType.LIST
        ? ListViewFeed(feeds: widget.curState.feeds, scrollController: _scrollController, hasReachedMax: widget.curState.hasReachedMax,)
        : GridViewFeed(feeds: widget.curState.feeds, scrollController: _scrollController,);
  }
}

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
            : FeedItemPortrait(item: ListAnimeResponse.fromMap(feeds[index]),);
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
            : FeedItem(item: ListAnimeResponse.fromMap(feeds[index]),);
      },
      itemCount: hasReachedMax
          ? feeds.length
          : feeds.length + 1,
      controller: scrollController,
    );
  }
}
