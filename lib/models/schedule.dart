import 'dart:convert';

class Schedule {
  final String time;
  final int id;

  const Schedule({
    required this.time,
    required this.id,
  });

  Schedule copyWith({
    String? time,
    int? id,
  }) {
    return Schedule(
      time: time ?? this.time,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'id': id,
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      time: map['time'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source));

  @override
  String toString() => 'Schedule(time: $time, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Schedule && other.time == time && other.id == id;
  }

  @override
  int get hashCode => time.hashCode ^ id.hashCode;
}
