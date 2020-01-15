import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/bloc/anime/anime_event.dart';
import 'package:flutter_app/bloc/anime/anime_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class AnimeBloc extends Bloc<AppEvent, ListState> {
  final http.Client httpClient;
  var nextLink;

  AnimeBloc({@required this.httpClient});

  @override
  ListState get initialState => ListUninitialized();

  @override
  Stream<ListState> mapEventToState(AppEvent event) async* {
    final curState = state;
    if (event is Fetch && !_hasReachedMax(curState)) {
      try {
        if (curState is ListUninitialized) {
          final feed = await _fetchFeed(20, 0);
          yield ListLoaded(feeds: feed, hasReachedMax: false);
        }
        if (curState is ListLoaded) {
          final feeds = await _fetchFeed(20, curState.feeds.length + 20);
          curState.feeds.addAll(feeds);
          yield feeds.isEmpty
              ? curState.copyWith(hasReachedMax: true)
              : ListLoaded(
              feeds: curState.feeds + feeds,
              hasReachedMax: false
          );
        }
      } catch (e) {
        log(e);
        yield ListError();
      }
    }
  }

  bool _hasReachedMax(ListState state) => state is ListLoaded && state.hasReachedMax;

  Future<List> _fetchFeed(int _pageOffset, int _startPage) async {
    var url = nextLink != null
        ? nextLink
        : "https://kitsu.io/api/edge/anime?page%5Blimit%5D=$_pageOffset&page%5Boffset%5D=$_startPage";
    log("${DateTime.now()} call api $url");
    final response = await httpClient.get(url,);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var body = json.decode(response.body);
      final data = body['data'] as List;

      nextLink = body["links"]["next"];

      return data.toList();
    } else {
      throw Exception("error fetching");
    }
  }
}