import 'dart:convert';

import 'package:flutter_app/model/feature/model_anime.dart';
import 'package:flutter_app/model/feature/links.dart';
import 'package:flutter_app/model/feature/relationships.dart';


class ListAnimeResponse {
  final String id;
  final String type;
  final Links links;
  final AnimeModel attributes;
  final Relationships relationships;
  ListAnimeResponse({
    this.id,
    this.type,
    this.links,
    this.attributes,
    this.relationships,
  });

  ListAnimeResponse copyWith({
    String id,
    String type,
    Links links,
    AnimeModel attributes,
    Relationships relationships,
  }) {
    return ListAnimeResponse(
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

  static ListAnimeResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ListAnimeResponse(
      id: map['id'],
      type: map['type'],
      links: Links.fromMap(map['links']),
      attributes: AnimeModel.fromMap(map['attributes']),
      relationships: Relationships.fromMap(map['relationships']),
    );
  }

  String toJson() => json.encode(toMap());

  static ListAnimeResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Feed id: $id, type: $type, links: $links, attributes: $attributes, relationships: $relationships';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ListAnimeResponse &&
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