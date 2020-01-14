import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/anime/anime_bloc.dart';
import 'package:flutter_app/bloc/anime/anime_event.dart';
import 'package:flutter_app/bloc/anime/anime_state.dart';
import 'package:flutter_app/feature/type.dart';
import 'package:flutter_app/model/feature/feed.dart';
import 'package:flutter_app/widget/bottom_loader.dart';
import 'package:flutter_app/widget/feed_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MoreAnimeManga extends StatefulWidget {
  @override
  _MoreAnimeMangaState createState() => _MoreAnimeMangaState();
}

class _MoreAnimeMangaState extends State<MoreAnimeManga> {
  final _scrollController = ScrollController();
  final _scrollThreshHold = 200.0;
  AnimeBloc _animBloc = AnimeBloc(httpClient: http.Client());
  var curState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _animBloc.add(Fetch());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll < _scrollThreshHold && curState is! Loading) {
      _animBloc.add(Fetch());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("${(ModalRoute.of(context).settings.arguments as TypeAorM)?.toString()?.split(".")?.last}"),
        centerTitle: true,
      ),
      body: BlocBuilder<AnimeBloc, ListState>(
        bloc: _animBloc,
        builder: (context, state) {
          curState = state;
          if (state is ListError) {
            return Center(
              child: Text("hello"),
            );
          }

          if (state is ListLoaded || state is Loading) {
            return Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.feeds.length
                      ? BottomLoader()
                      : FeedItem(item: Feed.fromMap(state.feeds[index]) ,);
                },
                itemCount: state.hasReachedMax
                    ? state.feeds.length
                    : state.feeds.length + 1,
                controller: _scrollController,
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.deepPurpleAccent),
            ),
          );
        },
      ),
    );
  }
}
