import 'dart:convert';

import 'cover_image.dart';
import 'titles.dart';
import 'rating_frequencies.dart';
import 'poster_image.dart';

class Attributes {
  final String createdAt;
  final String updatedAt;
  final String slug;
  final String synopsis;
  final int coverImageTopOffset;
  final Titles titles;
  final String canonicalTitle;
  final List<String> abbreviatedTitles;
  final String averageRating;
  final RatingFrequencies ratingFrequencies;
  final int userCount;
  final int favoritesCount;
  final String startDate;
  final String endDate;
  final int popularityRank;
  final int ratingRank;
  final String ageRating;
  final String ageRatingGuide;
  final String subtype;
  final String status;
  final String tba;
  final PosterImage posterImage;
  final CoverImage coverImage;
  final int episodeCount;
  final int episodeLength;
  final String youtubeVideoId;
  final String showType;
  final bool nsfw;
  Attributes({
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.synopsis,
    this.coverImageTopOffset,
    this.titles,
    this.canonicalTitle,
    this.abbreviatedTitles,
    this.averageRating,
    this.ratingFrequencies,
    this.userCount,
    this.favoritesCount,
    this.startDate,
    this.endDate,
    this.popularityRank,
    this.ratingRank,
    this.ageRating,
    this.ageRatingGuide,
    this.subtype,
    this.status,
    this.tba,
    this.posterImage,
    this.coverImage,
    this.episodeCount,
    this.episodeLength,
    this.youtubeVideoId,
    this.showType,
    this.nsfw,
  });

  Attributes copyWith({
    String createdAt,
    String updatedAt,
    String slug,
    String synopsis,
    int coverImageTopOffset,
    Titles titles,
    String canonicalTitle,
    List<String> abbreviatedTitles,
    String averageRating,
    RatingFrequencies ratingFrequencies,
    int userCount,
    int favoritesCount,
    String startDate,
    String endDate,
    int popularityRank,
    int ratingRank,
    String ageRating,
    String ageRatingGuide,
    String subtype,
    String status,
    String tba,
    PosterImage posterImage,
    CoverImage coverImage,
    int episodeCount,
    int episodeLength,
    String youtubeVideoId,
    String showType,
    bool nsfw,
  }) {
    return Attributes(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      slug: slug ?? this.slug,
      synopsis: synopsis ?? this.synopsis,
      coverImageTopOffset: coverImageTopOffset ?? this.coverImageTopOffset,
      titles: titles ?? this.titles,
      canonicalTitle: canonicalTitle ?? this.canonicalTitle,
      abbreviatedTitles: abbreviatedTitles ?? this.abbreviatedTitles,
      averageRating: averageRating ?? this.averageRating,
      ratingFrequencies: ratingFrequencies ?? this.ratingFrequencies,
      userCount: userCount ?? this.userCount,
      favoritesCount: favoritesCount ?? this.favoritesCount,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      popularityRank: popularityRank ?? this.popularityRank,
      ratingRank: ratingRank ?? this.ratingRank,
      ageRating: ageRating ?? this.ageRating,
      ageRatingGuide: ageRatingGuide ?? this.ageRatingGuide,
      subtype: subtype ?? this.subtype,
      status: status ?? this.status,
      tba: tba ?? this.tba,
      posterImage: posterImage ?? this.posterImage,
      coverImage: coverImage ?? this.coverImage,
      episodeCount: episodeCount ?? this.episodeCount,
      episodeLength: episodeLength ?? this.episodeLength,
      youtubeVideoId: youtubeVideoId ?? this.youtubeVideoId,
      showType: showType ?? this.showType,
      nsfw: nsfw ?? this.nsfw,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'slug': slug,
      'synopsis': synopsis,
      'coverImageTopOffset': coverImageTopOffset,
      'titles': titles.toMap(),
      'canonicalTitle': canonicalTitle,
      'abbreviatedTitles': List<dynamic>.from(abbreviatedTitles.map((x) => x)),
      'averageRating': averageRating,
      'ratingFrequencies': ratingFrequencies.toMap(),
      'userCount': userCount,
      'favoritesCount': favoritesCount,
      'startDate': startDate,
      'endDate': endDate,
      'popularityRank': popularityRank,
      'ratingRank': ratingRank,
      'ageRating': ageRating,
      'ageRatingGuide': ageRatingGuide,
      'subtype': subtype,
      'status': status,
      'tba': tba,
      'posterImage': posterImage.toMap(),
      'coverImage': coverImage.toMap(),
      'episodeCount': episodeCount,
      'episodeLength': episodeLength,
      'youtubeVideoId': youtubeVideoId,
      'showType': showType,
      'nsfw': nsfw,
    };
  }

  static Attributes fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Attributes(
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      slug: map['slug'],
      synopsis: map['synopsis'],
      coverImageTopOffset: map['coverImageTopOffset']?.toInt(),
      titles: Titles.fromMap(map['titles']),
      canonicalTitle: map['canonicalTitle'],
      abbreviatedTitles: List<String>.from(map['abbreviatedTitles'] ?? []),
      averageRating: map['averageRating'],
      ratingFrequencies: RatingFrequencies.fromMap(map['ratingFrequencies']),
      userCount: map['userCount']?.toInt(),
      favoritesCount: map['favoritesCount']?.toInt(),
      startDate: map['startDate'],
      endDate: map['endDate'],
      popularityRank: map['popularityRank']?.toInt(),
      ratingRank: map['ratingRank']?.toInt(),
      ageRating: map['ageRating'],
      ageRatingGuide: map['ageRatingGuide'],
      subtype: map['subtype'],
      status: map['status'],
      tba: map['tba'],
      posterImage: PosterImage.fromMap(map['posterImage']),
      coverImage: CoverImage.fromMap(map['coverImage']),
      episodeCount: map['episodeCount']?.toInt(),
      episodeLength: map['episodeLength']?.toInt(),
      youtubeVideoId: map['youtubeVideoId'],
      showType: map['showType'],
      nsfw: map['nsfw'],
    );
  }

  String toJson() => json.encode(toMap());

  static Attributes fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Attributes createdAt: $createdAt, updatedAt: $updatedAt, slug: $slug, synopsis: $synopsis, coverImageTopOffset: $coverImageTopOffset, titles: $titles, canonicalTitle: $canonicalTitle, abbreviatedTitles: $abbreviatedTitles, averageRating: $averageRating, ratingFrequencies: $ratingFrequencies, userCount: $userCount, favoritesCount: $favoritesCount, startDate: $startDate, endDate: $endDate, popularityRank: $popularityRank, ratingRank: $ratingRank, ageRating: $ageRating, ageRatingGuide: $ageRatingGuide, subtype: $subtype, status: $status, tba: $tba, posterImage: $posterImage, coverImage: $coverImage, episodeCount: $episodeCount, episodeLength: $episodeLength, youtubeVideoId: $youtubeVideoId, showType: $showType, nsfw: $nsfw';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Attributes &&
      o.createdAt == createdAt &&
      o.updatedAt == updatedAt &&
      o.slug == slug &&
      o.synopsis == synopsis &&
      o.coverImageTopOffset == coverImageTopOffset &&
      o.titles == titles &&
      o.canonicalTitle == canonicalTitle &&
      o.abbreviatedTitles == abbreviatedTitles &&
      o.averageRating == averageRating &&
      o.ratingFrequencies == ratingFrequencies &&
      o.userCount == userCount &&
      o.favoritesCount == favoritesCount &&
      o.startDate == startDate &&
      o.endDate == endDate &&
      o.popularityRank == popularityRank &&
      o.ratingRank == ratingRank &&
      o.ageRating == ageRating &&
      o.ageRatingGuide == ageRatingGuide &&
      o.subtype == subtype &&
      o.status == status &&
      o.tba == tba &&
      o.posterImage == posterImage &&
      o.coverImage == coverImage &&
      o.episodeCount == episodeCount &&
      o.episodeLength == episodeLength &&
      o.youtubeVideoId == youtubeVideoId &&
      o.showType == showType &&
      o.nsfw == nsfw;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
      updatedAt.hashCode ^
      slug.hashCode ^
      synopsis.hashCode ^
      coverImageTopOffset.hashCode ^
      titles.hashCode ^
      canonicalTitle.hashCode ^
      abbreviatedTitles.hashCode ^
      averageRating.hashCode ^
      ratingFrequencies.hashCode ^
      userCount.hashCode ^
      favoritesCount.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      popularityRank.hashCode ^
      ratingRank.hashCode ^
      ageRating.hashCode ^
      ageRatingGuide.hashCode ^
      subtype.hashCode ^
      status.hashCode ^
      tba.hashCode ^
      posterImage.hashCode ^
      coverImage.hashCode ^
      episodeCount.hashCode ^
      episodeLength.hashCode ^
      youtubeVideoId.hashCode ^
      showType.hashCode ^
      nsfw.hashCode;
  }
}