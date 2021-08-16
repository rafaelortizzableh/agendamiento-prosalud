import 'dart:convert';

class Therapy {
  final String therapyName;
  final int id;

  Therapy({
    required this.therapyName,
    required this.id,
  });

  Therapy copyWith({
    String? therapyName,
    int? id,
  }) {
    return Therapy(
      therapyName: therapyName ?? this.therapyName,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'therapyName': therapyName,
      'id': id,
    };
  }

  factory Therapy.fromMap(Map<String, dynamic> map) {
    return Therapy(
      therapyName: map['therapyName'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Therapy.fromJson(String source) =>
      Therapy.fromMap(json.decode(source));

  @override
  String toString() => 'Therapy(therapyName: $therapyName, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Therapy &&
        other.therapyName == therapyName &&
        other.id == id;
  }

  @override
  int get hashCode => therapyName.hashCode ^ id.hashCode;
}
