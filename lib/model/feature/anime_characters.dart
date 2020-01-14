import 'dart:convert';

import 'links.dart';

class AnimeCharacters {
  final Links links;
  AnimeCharacters({
    this.links,
  });

  AnimeCharacters copyWith({
    Links links,
  }) {
    return AnimeCharacters(
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'links': links.toMap(),
    };
  }

  static AnimeCharacters fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return AnimeCharacters(
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  static AnimeCharacters fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'AnimeCharacters links: $links';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is AnimeCharacters &&
      o.links == links;
  }

  @override
  int get hashCode => links.hashCode;
}