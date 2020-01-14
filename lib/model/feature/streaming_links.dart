import 'dart:convert';

import 'links.dart';


class StreamingLinks {
  final Links links;
  StreamingLinks({
    this.links,
  });

  StreamingLinks copyWith({
    Links links,
  }) {
    return StreamingLinks(
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'links': links.toMap(),
    };
  }

  static StreamingLinks fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return StreamingLinks(
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  static StreamingLinks fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'StreamingLinks links: $links';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is StreamingLinks &&
      o.links == links;
  }

  @override
  int get hashCode => links.hashCode;
}