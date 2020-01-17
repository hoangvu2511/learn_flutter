import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/bloc/anime/anime_event.dart';
import 'package:flutter_app/bloc/anime/anime_state.dart';
import 'package:flutter_app/constants.dart';
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
    try {
      if (event is Fetch && !_hasReachedMax(curState)) {
        yield Loading(
            feeds: curState.feeds ?? [],
            hasReachedMax: curState.hasReachedMax ?? false
        );

        final feeds = await _fetchFeed(event.mapParam);

        yield ListLoaded(
            feeds: (curState?.feeds ?? []) + feeds,
            hasReachedMax: feeds.isEmpty || nextLink == null
        );
      } else if (event is NewCall) {

        yield Loading(
          feeds: [],
          hasReachedMax: false
        );

        final feeds = await _newCall(event.mapParam);

        yield ListLoaded(
            feeds: feeds,
            hasReachedMax: feeds.isEmpty || nextLink == null
        );
      }
    } catch (e) {
      log(e);
      yield ListError();
    }
  }

  bool _hasReachedMax(ListState state) => state is ListLoaded && state.hasReachedMax;

  Future<List> _fetchFeed(Map<String, String> mapParam) async {
    log("${DateTime.now()} fetch call api $nextLink");

    final response = await httpClient.get(nextLink,);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var body = json.decode(response.body);
      final data = body['data'] as List;

      nextLink = body["links"]["next"];

      return data.toList();
    } else {
      throw Exception("error fetching");
    }
  }

  Future<List> _newCall(Map<String, String> mapParam) async {
    var url = Uri.https(BASE_URL, "/api/edge/anime", mapParam);

    log("${DateTime.now()} new call api $url");

    final response = await httpClient.get(url,);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var body = json.decode(response.body);
      final data = body['data'] as List;

      nextLink = body["links"]["next"];

      log("total count = ${body["meta"]["count"]}");

      return data.toList();
    } else {
      throw Exception("error fetching");
    }
  }
}