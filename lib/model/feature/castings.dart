import 'dart:convert';

import 'package:flutter_app/model/feature/links.dart';


class Castings {
  final Links links;
  Castings({
    this.links,
  });

  Castings copyWith({
    Links links,
  }) {
    return Castings(
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'links': links.toMap(),
    };
  }

  static Castings fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Castings(
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  static Castings fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Castings links: $links';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Castings &&
      o.links == links;
  }

  @override
  int get hashCode => links.hashCode;
}