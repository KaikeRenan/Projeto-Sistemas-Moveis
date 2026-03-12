class WorkoutSeries {
  final String id;
  final int repetitions;
  final double load;
  final int restSeconds;

  WorkoutSeries({
    required this.id,
    required this.repetitions,
    required this.load,
    required this.restSeconds,
  });

  factory WorkoutSeries.fromJson(Map<String, dynamic> json) {
    return WorkoutSeries(
      id: json['id'] as String,
      repetitions: json['repetitions'] as int,
      load: (json['load'] as num).toDouble(),
      restSeconds: json['rest_seconds'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'repetitions': repetitions,
      'load': load,
      'rest_seconds': restSeconds,
    };
  }

  WorkoutSeries copyWith({
    String? id,
    int? repetitions,
    double? load,
    int? restSeconds,
  }) {
    return WorkoutSeries(
      id: id ?? this.id,
      repetitions: repetitions ?? this.repetitions,
      load: load ?? this.load,
      restSeconds: restSeconds ?? this.restSeconds,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutSeries &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
