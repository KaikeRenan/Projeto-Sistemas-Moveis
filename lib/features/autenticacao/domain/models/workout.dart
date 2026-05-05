import 'enums.dart';

class Workout {
  final String id;
  final String name;
  final DayWeek dayWeek;
  final bool rest;

  Workout({
    required this.id,
    required this.name,
    required this.dayWeek,
    required this.rest,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'] as String,
      name: json['name'] as String,
      dayWeek: DayWeek.values.byName(json['day_week'] as String),
      rest: json['rest'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'day_week': dayWeek.name, 'rest': rest};
  }

  Workout copyWith({String? id, String? name, DayWeek? dayWeek, bool? rest}) {
    return Workout(
      id: id ?? this.id,
      name: name ?? this.name,
      dayWeek: dayWeek ?? this.dayWeek,
      rest: rest ?? this.rest,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Workout && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
