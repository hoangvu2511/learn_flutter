import 'dart:convert';

import 'links.dart';

class Genres {
  final Links links;
  Genres({
    this.links,
  });

  Genres copyWith({
    Links links,
  }) {
    return Genres(
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'links': links.toMap(),
    };
  }

  static Genres fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Genres(
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  static Genres fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Genres links: $links';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Genres &&
      o.links == links;
  }

  @override
  int get hashCode => links.hashCode;
}