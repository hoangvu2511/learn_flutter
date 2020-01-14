import 'dart:convert';

import 'package:flutter_app/model/feature/links.dart';


class Episodes {
  final Links links;
  Episodes({
    this.links,
  });

  Episodes copyWith({
    Links links,
  }) {
    return Episodes(
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'links': links.toMap(),
    };
  }

  static Episodes fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Episodes(
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  static Episodes fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Episodes links: $links';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Episodes &&
      o.links == links;
  }

  @override
  int get hashCode => links.hashCode;
}