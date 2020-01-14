import 'dart:convert';

import 'links.dart';

class MediaRelationships {
  final Links links;
  MediaRelationships({
    this.links,
  });

  MediaRelationships copyWith({
    Links links,
  }) {
    return MediaRelationships(
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'links': links.toMap(),
    };
  }

  static MediaRelationships fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return MediaRelationships(
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  static MediaRelationships fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'MediaRelationships links: $links';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is MediaRelationships &&
      o.links == links;
  }

  @override
  int get hashCode => links.hashCode;
}