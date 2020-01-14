import 'dart:convert';

class RatingFrequencies {
  final String n2;
  final String n3;
  final String n4;
  final String n5;
  final String n6;
  final String n7;
  final String n8;
  final String n9;
  final String n10;
  final String n11;
  final String n12;
  final String n13;
  final String n14;
  final String n15;
  final String n16;
  final String n17;
  final String n18;
  final String n19;
  final String n20;
  RatingFrequencies({
    this.n2,
    this.n3,
    this.n4,
    this.n5,
    this.n6,
    this.n7,
    this.n8,
    this.n9,
    this.n10,
    this.n11,
    this.n12,
    this.n13,
    this.n14,
    this.n15,
    this.n16,
    this.n17,
    this.n18,
    this.n19,
    this.n20,
  });

  RatingFrequencies copyWith({
    String n2,
    String n3,
    String n4,
    String n5,
    String n6,
    String n7,
    String n8,
    String n9,
    String n10,
    String n11,
    String n12,
    String n13,
    String n14,
    String n15,
    String n16,
    String n17,
    String n18,
    String n19,
    String n20,
  }) {
    return RatingFrequencies(
      n2: n2 ?? this.n2,
      n3: n3 ?? this.n3,
      n4: n4 ?? this.n4,
      n5: n5 ?? this.n5,
      n6: n6 ?? this.n6,
      n7: n7 ?? this.n7,
      n8: n8 ?? this.n8,
      n9: n9 ?? this.n9,
      n10: n10 ?? this.n10,
      n11: n11 ?? this.n11,
      n12: n12 ?? this.n12,
      n13: n13 ?? this.n13,
      n14: n14 ?? this.n14,
      n15: n15 ?? this.n15,
      n16: n16 ?? this.n16,
      n17: n17 ?? this.n17,
      n18: n18 ?? this.n18,
      n19: n19 ?? this.n19,
      n20: n20 ?? this.n20,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '2': n2,
      '3': n3,
      '4': n4,
      '5': n5,
      '6': n6,
      '7': n7,
      '8': n8,
      '9': n9,
      '10': n10,
      '11': n11,
      '12': n12,
      '13': n13,
      '14': n14,
      '15': n15,
      '16': n16,
      '17': n17,
      '18': n18,
      '19': n19,
      '20': n20,
    };
  }

  static RatingFrequencies fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return RatingFrequencies(
      n2: map['2'],
      n3: map['3'],
      n4: map['4'],
      n5: map['5'],
      n6: map['6'],
      n7: map['7'],
      n8: map['8'],
      n9: map['9'],
      n10: map['10'],
      n11: map['11'],
      n12: map['12'],
      n13: map['13'],
      n14: map['14'],
      n15: map['15'],
      n16: map['16'],
      n17: map['17'],
      n18: map['18'],
      n19: map['19'],
      n20: map['20'],
    );
  }

  String toJson() => json.encode(toMap());

  static RatingFrequencies fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'RatingFrequencies n2: $n2, n3: $n3, n4: $n4, n5: $n5, n6: $n6, n7: $n7, n8: $n8, n9: $n9, n10: $n10, n11: $n11, n12: $n12, n13: $n13, n14: $n14, n15: $n15, n16: $n16, n17: $n17, n18: $n18, n19: $n19, n20: $n20';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is RatingFrequencies &&
      o.n2 == n2 &&
      o.n3 == n3 &&
      o.n4 == n4 &&
      o.n5 == n5 &&
      o.n6 == n6 &&
      o.n7 == n7 &&
      o.n8 == n8 &&
      o.n9 == n9 &&
      o.n10 == n10 &&
      o.n11 == n11 &&
      o.n12 == n12 &&
      o.n13 == n13 &&
      o.n14 == n14 &&
      o.n15 == n15 &&
      o.n16 == n16 &&
      o.n17 == n17 &&
      o.n18 == n18 &&
      o.n19 == n19 &&
      o.n20 == n20;
  }

  @override
  int get hashCode {
    return n2.hashCode ^
      n3.hashCode ^
      n4.hashCode ^
      n5.hashCode ^
      n6.hashCode ^
      n7.hashCode ^
      n8.hashCode ^
      n9.hashCode ^
      n10.hashCode ^
      n11.hashCode ^
      n12.hashCode ^
      n13.hashCode ^
      n14.hashCode ^
      n15.hashCode ^
      n16.hashCode ^
      n17.hashCode ^
      n18.hashCode ^
      n19.hashCode ^
      n20.hashCode;
  }
}