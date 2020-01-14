import 'dart:convert';

class PosterImage {
  final String tiny;
  final String small;
  final String medium;
  final String large;
  final String original;
  PosterImage({
    this.tiny,
    this.small,
    this.medium,
    this.large,
    this.original,
  });

  PosterImage copyWith({
    String tiny,
    String small,
    String medium,
    String large,
    String original,
  }) {
    return PosterImage(
      tiny: tiny ?? this.tiny,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      original: original ?? this.original,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tiny': tiny,
      'small': small,
      'medium': medium,
      'large': large,
      'original': original,
    };
  }

  static PosterImage fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return PosterImage(
      tiny: map['tiny'],
      small: map['small'],
      medium: map['medium'],
      large: map['large'],
      original: map['original'],
    );
  }

  String toJson() => json.encode(toMap());

  static PosterImage fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'PosterImage tiny: $tiny, small: $small, medium: $medium, large: $large, original: $original';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is PosterImage &&
      o.tiny == tiny &&
      o.small == small &&
      o.medium == medium &&
      o.large == large &&
      o.original == original;
  }

  @override
  int get hashCode {
    return tiny.hashCode ^
      small.hashCode ^
      medium.hashCode ^
      large.hashCode ^
      original.hashCode;
  }
}