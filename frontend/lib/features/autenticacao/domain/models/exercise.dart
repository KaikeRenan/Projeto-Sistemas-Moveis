import 'enums.dart';

class Exercise {
  final String id;
  final String name;
  final MuscularGroup muscularGroup;

  Exercise({required this.id, required this.name, required this.muscularGroup});

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'] as String,
      name: json['name'] as String,
      muscularGroup: MuscularGroup.values.byName(
        json['muscular_group'] as String,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'muscular_group': muscularGroup.name};
  }

  Exercise copyWith({String? id, String? name, MuscularGroup? muscularGroup}) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      muscularGroup: muscularGroup ?? this.muscularGroup,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Exercise && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
