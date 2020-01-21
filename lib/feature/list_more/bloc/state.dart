import 'package:equatable/equatable.dart';

abstract class ListState extends Equatable {
  final List feeds;
  final bool hasReachedMax;

  const ListState({this.feeds, this.hasReachedMax});

  @override
  List<Object> get props => [];
}

class ListUninitialized extends ListState {}

class Loading extends ListState {
  final List feeds;
  final bool hasReachedMax;

  const Loading({this.feeds, this.hasReachedMax});

  Loading copyWith({List feed, bool hasReachedMax}) {
    return Loading(
        feeds: feeds ?? this.feeds,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  List<Object> get props => [feeds, hasReachedMax];
}

class ListError extends ListState {}

class ListLoaded extends ListState {
  final List feeds;
  final bool hasReachedMax;

  const ListLoaded({this.feeds, this.hasReachedMax});

  ListLoaded copyWith({List feed, bool hasReachedMax}) {
    return ListLoaded(
        feeds: feeds ?? this.feeds,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  List<Object> get props => [feeds, hasReachedMax];
}
