import 'dart:convert';

import 'package:flutter_app/model/feature/castings.dart';
import 'package:flutter_app/model/feature/categories.dart';
import 'package:flutter_app/model/feature/reviews.dart';
import 'package:flutter_app/model/feature/streaming_links.dart';

import 'episodes.dart';
import 'genres.dart';
import 'anime_productions.dart';
import 'anime_characters.dart';
import 'anime_staff.dart';
import 'installments.dart';
import 'mappings.dart';
import 'media_relationships.dart';

class Relationships {
  final Genres genres;
  final Categories categories;
  final Castings castings;
  final Installments installments;
  final Mappings mappings;
  final Reviews reviews;
  final MediaRelationships mediaRelationships;
  final Episodes episodes;
  final StreamingLinks streamingLinks;
  final AnimeProductions animeProductions;
  final AnimeCharacters animeCharacters;
  final AnimeStaff animeStaff;
  Relationships({
    this.genres,
    this.categories,
    this.castings,
    this.installments,
    this.mappings,
    this.reviews,
    this.mediaRelationships,
    this.episodes,
    this.streamingLinks,
    this.animeProductions,
    this.animeCharacters,
    this.animeStaff,
  });

  Relationships copyWith({
    Genres genres,
    Categories categories,
    Castings castings,
    Installments installments,
    Mappings mappings,
    Reviews reviews,
    MediaRelationships mediaRelationships,
    Episodes episodes,
    StreamingLinks streamingLinks,
    AnimeProductions animeProductions,
    AnimeCharacters animeCharacters,
    AnimeStaff animeStaff,
  }) {
    return Relationships(
      genres: genres ?? this.genres,
      categories: categories ?? this.categories,
      castings: castings ?? this.castings,
      installments: installments ?? this.installments,
      mappings: mappings ?? this.mappings,
      reviews: reviews ?? this.reviews,
      mediaRelationships: mediaRelationships ?? this.mediaRelationships,
      episodes: episodes ?? this.episodes,
      streamingLinks: streamingLinks ?? this.streamingLinks,
      animeProductions: animeProductions ?? this.animeProductions,
      animeCharacters: animeCharacters ?? this.animeCharacters,
      animeStaff: animeStaff ?? this.animeStaff,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'genres': genres.toMap(),
      'categories': categories.toMap(),
      'castings': castings.toMap(),
      'installments': installments.toMap(),
      'mappings': mappings.toMap(),
      'reviews': reviews.toMap(),
      'mediaRelationships': mediaRelationships.toMap(),
      'episodes': episodes.toMap(),
      'streamingLinks': streamingLinks.toMap(),
      'animeProductions': animeProductions.toMap(),
      'animeCharacters': animeCharacters.toMap(),
      'animeStaff': animeStaff.toMap(),
    };
  }

  static Relationships fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Relationships(
      genres: Genres.fromMap(map['genres']),
      categories: Categories.fromMap(map['categories']),
      castings: Castings.fromMap(map['castings']),
      installments: Installments.fromMap(map['installments']),
      mappings: Mappings.fromMap(map['mappings']),
      reviews: Reviews.fromMap(map['reviews']),
      mediaRelationships: MediaRelationships.fromMap(map['mediaRelationships']),
      episodes: Episodes.fromMap(map['episodes']),
      streamingLinks: StreamingLinks.fromMap(map['streamingLinks']),
      animeProductions: AnimeProductions.fromMap(map['animeProductions']),
      animeCharacters: AnimeCharacters.fromMap(map['animeCharacters']),
      animeStaff: AnimeStaff.fromMap(map['animeStaff']),
    );
  }

  String toJson() => json.encode(toMap());

  static Relationships fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Relationships genres: $genres, categories: $categories, castings: $castings, installments: $installments, mappings: $mappings, reviews: $reviews, mediaRelationships: $mediaRelationships, episodes: $episodes, streamingLinks: $streamingLinks, animeProductions: $animeProductions, animeCharacters: $animeCharacters, animeStaff: $animeStaff';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Relationships &&
      o.genres == genres &&
      o.categories == categories &&
      o.castings == castings &&
      o.installments == installments &&
      o.mappings == mappings &&
      o.reviews == reviews &&
      o.mediaRelationships == mediaRelationships &&
      o.episodes == episodes &&
      o.streamingLinks == streamingLinks &&
      o.animeProductions == animeProductions &&
      o.animeCharacters == animeCharacters &&
      o.animeStaff == animeStaff;
  }

  @override
  int get hashCode {
    return genres.hashCode ^
      categories.hashCode ^
      castings.hashCode ^
      installments.hashCode ^
      mappings.hashCode ^
      reviews.hashCode ^
      mediaRelationships.hashCode ^
      episodes.hashCode ^
      streamingLinks.hashCode ^
      animeProductions.hashCode ^
      animeCharacters.hashCode ^
      animeStaff.hashCode;
  }
}