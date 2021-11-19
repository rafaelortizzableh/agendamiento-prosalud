import 'dart:convert';

class InsuranceCompany {
  final String name;
  final int id;

  const InsuranceCompany({
    required this.name,
    required this.id,
  });

  InsuranceCompany copyWith({
    String? name,
    int? id,
  }) {
    return InsuranceCompany(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
    };
  }

  factory InsuranceCompany.fromMap(Map<String, dynamic> map) {
    return InsuranceCompany(
      name: map['name'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InsuranceCompany.fromJson(String source) =>
      InsuranceCompany.fromMap(json.decode(source));

  @override
  String toString() => 'InsuranceCompany(name: $name, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InsuranceCompany && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
