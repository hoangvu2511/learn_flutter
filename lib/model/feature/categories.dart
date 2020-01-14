import 'dart:convert';

import 'package:flutter_app/model/feature/links.dart';


class Categories {
  final Links links;
  Categories({
    this.links,
  });

  Categories copyWith({
    Links links,
  }) {
    return Categories(
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'links': links.toMap(),
    };
  }

  static Categories fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Categories(
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  static Categories fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Categories links: $links';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Categories &&
      o.links == links;
  }

  @override
  int get hashCode => links.hashCode;
}