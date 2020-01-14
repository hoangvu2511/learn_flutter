import 'dart:convert';

class CoverImage {
  final String tiny;
  final String small;
  final String large;
  final String original;
  CoverImage({
    this.tiny,
    this.small,
    this.large,
    this.original,
  });

  CoverImage copyWith({
    String tiny,
    String small,
    String large,
    String original,
  }) {
    return CoverImage(
      tiny: tiny ?? this.tiny,
      small: small ?? this.small,
      large: large ?? this.large,
      original: original ?? this.original,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tiny': tiny,
      'small': small,
      'large': large,
      'original': original,
    };
  }

  static CoverImage fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return CoverImage(
      tiny: map['tiny'],
      small: map['small'],
      large: map['large'],
      original: map['original'],
    );
  }

  String toJson() => json.encode(toMap());

  static CoverImage fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoverImage tiny: $tiny, small: $small, large: $large, original: $original';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is CoverImage &&
      o.tiny == tiny &&
      o.small == small &&
      o.large == large &&
      o.original == original;
  }

  @override
  int get hashCode {
    return tiny.hashCode ^
      small.hashCode ^
      large.hashCode ^
      original.hashCode;
  }
}