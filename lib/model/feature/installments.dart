import 'dart:convert';

import 'package:flutter_app/model/feature/links.dart';

class Installments {
  final Links links;
  Installments({
    this.links,
  });

  Installments copyWith({
    Links links,
  }) {
    return Installments(
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'links': links.toMap(),
    };
  }

  static Installments fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Installments(
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  static Installments fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Installments links: $links';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Installments &&
      o.links == links;
  }

  @override
  int get hashCode => links.hashCode;
}