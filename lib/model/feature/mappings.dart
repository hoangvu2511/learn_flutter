import 'dart:convert';

import 'package:flutter_app/model/feature/links.dart';

class Mappings {
  final Links links;
  Mappings({
    this.links,
  });

  Mappings copyWith({
    Links links,
  }) {
    return Mappings(
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'links': links.toMap(),
    };
  }

  static Mappings fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Mappings(
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  static Mappings fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Mappings links: $links';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Mappings &&
      o.links == links;
  }

  @override
  int get hashCode => links.hashCode;
}