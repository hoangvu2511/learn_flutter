import 'dart:convert';

import 'links.dart';


class Reviews {
  final Links links;
  Reviews({
    this.links,
  });

  Reviews copyWith({
    Links links,
  }) {
    return Reviews(
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'links': links.toMap(),
    };
  }

  static Reviews fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Reviews(
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  static Reviews fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Reviews links: $links';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Reviews &&
      o.links == links;
  }

  @override
  int get hashCode => links.hashCode;
}