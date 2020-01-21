import 'package:flutter_app/constants.dart';

enum TypeAorM{
  ANIME,
  MANGA
}

enum TypeDropDown{
  season,
  seasonYear,
  ageRating
}

extension TypeDropDownExt on TypeDropDown{

  static const filters = {
    TypeDropDown.season: FILTER_SEASON,
    TypeDropDown.seasonYear: FILTER_SEASON_YEAR,
    TypeDropDown.ageRating: FILTER_AGE_RATING
  };

  String get filter => filters[this];

}


enum ageRating{
  G,PG,R,R18
}