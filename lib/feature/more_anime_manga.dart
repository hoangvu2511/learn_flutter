import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/anime/anime_bloc.dart';
import 'package:flutter_app/bloc/anime/anime_event.dart';
import 'package:flutter_app/bloc/anime/anime_state.dart';
import 'package:flutter_app/feature/type.dart';
import 'package:flutter_app/widget/feed_view.dart';
import 'package:flutter_app/widget/loading.dart';
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
  var count = 1;

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0.0,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 500),
          );
        },
        child: Icon(Icons.arrow_upward),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Spacer(),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (count == 1) {
                          count = 2;
                        } else {
                          count = 1;
                        }
                      });
                    },
                    child: Icon(Icons.grid_on)
                )
              ],
            ),
          ),
          BlocBuilder<AnimeBloc, ListState>(
            bloc: _animBloc,
            builder: (context, state) {
              curState = state;
              if (state is ListError) {
                return Center(
                  child: Text("hello"),
                );
              }

              if (state is ListLoaded || state is Loading) {
                return Expanded(
                    child: count == 2
                        ? GridViewFeed(feeds: state.feeds, scrollController: _scrollController,)
                        : ListViewFeed(feeds: state.feeds, scrollController: _scrollController, hasReachedMax: state.hasReachedMax,)
                );
              }

              return CustomLoading();
            },
          ),
        ],
      ),
    );
  }
}
