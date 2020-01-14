import 'dart:convert';

import 'links.dart';

class AnimeProductions {
  final Links links;
  AnimeProductions({
    this.links,
  });

  AnimeProductions copyWith({
    Links links,
  }) {
    return AnimeProductions(
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'links': links.toMap(),
    };
  }

  static AnimeProductions fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return AnimeProductions(
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  static AnimeProductions fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'AnimeProductions links: $links';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is AnimeProductions &&
      o.links == links;
  }

  @override
  int get hashCode => links.hashCode;
}