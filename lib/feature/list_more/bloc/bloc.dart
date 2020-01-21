import 'dart:developer';

import 'package:flutter_app/repository/base_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class AnimeBloc extends Bloc<AppEvent, ListState> {
  final BaseListRepository _repository;

  AnimeBloc(BaseListRepository repository) : _repository = repository;

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

        final feeds = await _repository.fetch();

        yield ListLoaded(
            feeds: (curState?.feeds ?? []) + feeds[0],
            hasReachedMax: feeds[1]
        );
      } else if (event is NewCall) {
        yield Loading(
            feeds: [],
            hasReachedMax: false
        );

        final feeds = await _repository.newCall(event.mapParam);

        yield ListLoaded(
            feeds: feeds[0] as List,
            hasReachedMax: feeds[1]
        );
      }
    } catch (e) {
      log(e);
      yield ListError();
    }
  }

  bool _hasReachedMax(ListState state) => state is ListLoaded && state.hasReachedMax;
}