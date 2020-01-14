import 'dart:convert';

import 'package:flutter_app/model/feature/attributes.dart';
import 'package:flutter_app/model/feature/links.dart';
import 'package:flutter_app/model/feature/relationships.dart';


class Feed {
  final String id;
  final String type;
  final Links links;
  final Attributes attributes;
  final Relationships relationships;
  Feed({
    this.id,
    this.type,
    this.links,
    this.attributes,
    this.relationships,
  });

  Feed copyWith({
    String id,
    String type,
    Links links,
    Attributes attributes,
    Relationships relationships,
  }) {
    return Feed(
      id: id ?? this.id,
      type: type ?? this.type,
      links: links ?? this.links,
      attributes: attributes ?? this.attributes,
      relationships: relationships ?? this.relationships,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'links': links.toMap(),
      'attributes': attributes.toMap(),
      'relationships': relationships.toMap(),
    };
  }

  static Feed fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Feed(
      id: map['id'],
      type: map['type'],
      links: Links.fromMap(map['links']),
      attributes: Attributes.fromMap(map['attributes']),
      relationships: Relationships.fromMap(map['relationships']),
    );
  }

  String toJson() => json.encode(toMap());

  static Feed fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Feed id: $id, type: $type, links: $links, attributes: $attributes, relationships: $relationships';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Feed &&
      o.id == id &&
      o.type == type &&
      o.links == links &&
      o.attributes == attributes &&
      o.relationships == relationships;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      type.hashCode ^
      links.hashCode ^
      attributes.hashCode ^
      relationships.hashCode;
  }
}