import 'dart:convert';

class TypeOfId {
  final String type;
  final int id;
  TypeOfId({
    required this.type,
    required this.id,
  });

  TypeOfId copyWith({
    String? type,
    int? id,
  }) {
    return TypeOfId(
      type: type ?? this.type,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'id': id,
    };
  }

  factory TypeOfId.fromMap(Map<String, dynamic> map) {
    return TypeOfId(
      type: map['type'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeOfId.fromJson(String source) =>
      TypeOfId.fromMap(json.decode(source));

  @override
  String toString() => 'TypeOfId(type: $type, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TypeOfId && other.type == type && other.id == id;
  }

  @override
  int get hashCode => type.hashCode ^ id.hashCode;
}
