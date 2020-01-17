import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  final Map<String, String> mapParam;
  AppEvent({this.mapParam});

  @override
  List<Object> get props => [];
}

class Fetch extends AppEvent{
  Fetch({Map<String, String> mapParam}): super(mapParam: mapParam);
}

class NewCall extends AppEvent{
  NewCall({Map<String, String> mapParam}): super(mapParam: mapParam);
}
