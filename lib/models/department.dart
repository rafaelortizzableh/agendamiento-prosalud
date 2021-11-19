import 'dart:convert';

class Department {
  final String name;
  final int id;
  final String? capital;

  const Department({
    required this.name,
    required this.id,
    this.capital,
  });

  Department copyWith({
    String? name,
    int? id,
    String? capital,
  }) {
    return Department(
      name: name ?? this.name,
      id: id ?? this.id,
      capital: capital ?? this.capital,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'capital': capital,
    };
  }

  factory Department.fromMap(Map<String, dynamic> map) {
    return Department(
      name: map['name'],
      id: map['id'],
      capital: map['capital'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Department.fromJson(String source) =>
      Department.fromMap(json.decode(source));

  @override
  String toString() => 'Department(name: $name, id: $id, capital: $capital)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Department &&
        other.name == name &&
        other.id == id &&
        other.capital == capital;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ capital.hashCode;
}
