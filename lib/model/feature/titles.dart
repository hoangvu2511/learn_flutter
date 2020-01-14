import 'dart:convert';

class Titles {
  final String en;
  final String en_jp;
  final String ja_jp;
  Titles({
    this.en,
    this.en_jp,
    this.ja_jp,
  });

  Titles copyWith({
    String en,
    String en_jp,
    String ja_jp,
  }) {
    return Titles(
      en: en ?? this.en,
      en_jp: en_jp ?? this.en_jp,
      ja_jp: ja_jp ?? this.ja_jp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'en': en,
      'en_jp': en_jp,
      'ja_jp': ja_jp,
    };
  }

  static Titles fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Titles(
      en: map['en'],
      en_jp: map['en_jp'],
      ja_jp: map['ja_jp'],
    );
  }

  String toJson() => json.encode(toMap());

  static Titles fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Titles en: $en, en_jp: $en_jp, ja_jp: $ja_jp';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Titles &&
      o.en == en &&
      o.en_jp == en_jp &&
      o.ja_jp == ja_jp;
  }

  @override
  int get hashCode => en.hashCode ^ en_jp.hashCode ^ ja_jp.hashCode;
}