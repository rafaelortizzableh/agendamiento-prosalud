import 'dart:convert';

class Locality {
  String name;
  String id;
  bool? isCapital;
  String departmentId;
  String? departmentName;

  Locality({
    required this.name,
    required this.id,
    this.isCapital,
    required this.departmentId,
    this.departmentName,
  });

  Locality copyWith({
    String? name,
    String? id,
    bool? isCapital,
    String? departmentId,
    String? departmentName,
  }) {
    return Locality(
      name: name ?? this.name,
      id: id ?? this.id,
      isCapital: isCapital ?? this.isCapital,
      departmentId: departmentId ?? this.departmentId,
      departmentName: departmentName ?? this.departmentName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'isCapital': isCapital,
      'departmentId': departmentId,
      'departmentName': departmentName,
    };
  }

  factory Locality.fromMap(Map<String, dynamic> map) {
    return Locality(
      name: map['name'],
      id: map['id'],
      isCapital: map['isCapital'],
      departmentId: map['departmentId'],
      departmentName: map['departmentName'],
    );
  }
  factory Locality.fromDaneMap(Map<String, dynamic> map) {
    return Locality(
      name: map['municipio'],
      id: map['c_digo_dane_del_municipio'],
      departmentId: map['c_digo_dane_del_departamento'],
      departmentName: map['departamento'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Locality.fromJson(String source) =>
      Locality.fromMap(json.decode(source));

  factory Locality.fromDaneJson(String source) =>
      Locality.fromDaneMap(json.decode(source));

  @override
  String toString() {
    return 'Locality(name: $name, id: $id, isCapital: $isCapital, departmentId: $departmentId, departmentName: $departmentName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Locality &&
        other.name == name &&
        other.id == id &&
        other.isCapital == isCapital &&
        other.departmentId == departmentId &&
        other.departmentName == departmentName;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        isCapital.hashCode ^
        departmentId.hashCode ^
        departmentName.hashCode;
  }
}
