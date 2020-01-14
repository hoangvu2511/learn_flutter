import 'dart:convert';

import 'links.dart';

class AnimeStaff {
  final Links links;
  AnimeStaff({
    this.links,
  });

  AnimeStaff copyWith({
    Links links,
  }) {
    return AnimeStaff(
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'links': links.toMap(),
    };
  }

  static AnimeStaff fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return AnimeStaff(
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  static AnimeStaff fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'AnimeStaff links: $links';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is AnimeStaff &&
      o.links == links;
  }

  @override
  int get hashCode => links.hashCode;
}