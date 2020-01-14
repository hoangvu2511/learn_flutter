import 'dart:convert';

class Links {
  final String self;
  final String related;
  Links({
    this.self,
    this.related,
  });

  Links copyWith({
    String self,
    String related,
  }) {
    return Links(
      self: self ?? this.self,
      related: related ?? this.related,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'self': self,
      'related': related,
    };
  }

  static Links fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Links(
      self: map['self'],
      related: map['related'],
    );
  }

  String toJson() => json.encode(toMap());

  static Links fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Links self: $self, related: $related';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Links &&
      o.self == self &&
      o.related == related;
  }

  @override
  int get hashCode => self.hashCode ^ related.hashCode;
}