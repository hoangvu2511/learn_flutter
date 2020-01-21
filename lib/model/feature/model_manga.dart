import 'dart:convert';

import 'package:flutter_app/model/feature/cover_image.dart';
import 'package:flutter_app/model/feature/poster_image.dart';
import 'package:flutter_app/model/feature/titles.dart';

class MangaModel {
  final String createdAt;
  final String updatedAt;
  final String slug;
  final String synopsis;
  final int coverImageTopOffset;
  final Titles titles;
  final String canonicalTitle;
  final List<String> abbreviatedTitles;
  final String averageRating;
  final Map<String, String> ratingFrequencies;
  final int userCount;
  final int favoritesCount;
  final String startDate;
  final String endDate;
  final String nextRelease;
  final int popularityRank;
  final int ratingRank;
  final String ageRating;
  final String ageRatingGuide;
  final String subtype;
  final String status;
  final String tba;
  final PosterImage posterImage;
  final CoverImage coverImage;
  final int chapterCount;
  final int volumeCount;
  final String serialization;
  final String mangaType;

  MangaModel({this.createdAt, this.updatedAt, this.slug, this.synopsis, this.coverImageTopOffset, this.titles, this.canonicalTitle, this.abbreviatedTitles, this.averageRating, this.ratingFrequencies, this.userCount, this.favoritesCount, this.startDate, this.endDate, this.nextRelease, this.popularityRank, this.ratingRank, this.ageRating, this.ageRatingGuide, this.subtype, this.status, this.tba, this.posterImage, this.coverImage, this.chapterCount, this.volumeCount, this.serialization, this.mangaType});

  factory MangaModel.fromJson(Map<String, dynamic> json) {
    return MangaModel(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      slug: json['slug'],
      synopsis: json['synopsis'],
      coverImageTopOffset: json['coverImageTopOffset'],
      titles: json['titles'] != null ? Titles.fromJson(json['titles']) : null,
      canonicalTitle: json['canonicalTitle'],
      abbreviatedTitles: json['abbreviatedTitles'] != null ? new List<String>.from(json['abbreviatedTitles']) : null,
      averageRating: json['averageRating'],
      ratingFrequencies: json['ratingFrequencies'] != null ? json['ratingFrequencies'] : null,
      userCount: json['userCount'],
      favoritesCount: json['favoritesCount'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      nextRelease: json['nextRelease'],
      popularityRank: json['popularityRank'],
      ratingRank: json['ratingRank'],
      ageRating: json['ageRating'],
      ageRatingGuide: json['ageRatingGuide'],
      subtype: json['subtype'],
      status: json['status'],
      tba: json['tba'],
      posterImage: json['posterImage'] != null ? PosterImage.fromJson(json['posterImage']) : null,
      coverImage: json['coverImage'] != null ? CoverImage.fromJson(json['coverImage']) : null,
      chapterCount: json['chapterCount'],
      volumeCount: json['volumeCount'],
      serialization: json['serialization'],
      mangaType: json['mangaType'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['slug'] = this.slug;
    data['synopsis'] = this.synopsis;
    data['coverImageTopOffset'] = this.coverImageTopOffset;
    data['canonicalTitle'] = this.canonicalTitle;
    data['averageRating'] = this.averageRating;
    data['userCount'] = this.userCount;
    data['favoritesCount'] = this.favoritesCount;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['nextRelease'] = this.nextRelease;
    data['popularityRank'] = this.popularityRank;
    data['ratingRank'] = this.ratingRank;
    data['ageRating'] = this.ageRating;
    data['ageRatingGuide'] = this.ageRatingGuide;
    data['subtype'] = this.subtype;
    data['status'] = this.status;
    data['tba'] = this.tba;
    data['chapterCount'] = this.chapterCount;
    data['volumeCount'] = this.volumeCount;
    data['serialization'] = this.serialization;
    data['mangaType'] = this.mangaType;
    if (this.titles != null) {
      data['titles'] = this.titles.toJson();
    }
    if (this.abbreviatedTitles != null) {
      data['abbreviatedTitles'] = this.abbreviatedTitles;
    }
    if (this.ratingFrequencies != null) {
      data['ratingFrequencies'] = jsonEncode(this.ratingFrequencies);
    }
    if (this.posterImage != null) {
      data['posterImage'] = this.posterImage.toJson();
    }
    if (this.coverImage != null) {
      data['coverImage'] = this.coverImage.toJson();
    }
    return data;
  }
}