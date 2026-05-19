import 'enums.dart';

class Treino {
  final String id;
  final String nome;
  final DiaSemana diaSemana;
  final bool descanso;
  final List<String> exercicios;

  Treino({
    required this.id,
    required this.nome,
    required this.diaSemana,
    required this.descanso,
    required this.exercicios
  });

  factory Treino.fromJson(Map<String, dynamic> json) {
    return Treino(
      id: json['id'] as String,
      nome: json['nome'] as String,
      diaSemana: DiaSemana.values.byName(json['dia_semana'] as String),
      descanso: json['descanso'] as bool,
      exercicios: List<String>.from(
        json['exercicios'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'dia_semana': diaSemana.name,
      'descanso': descanso,
      'exercicios': exercicios,
    };
  }

  Treino copyWith({
    String? id,
    String? nome,
    DiaSemana? diaSemana,
    bool? descanso,
  }) {
    return Treino(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      diaSemana: diaSemana ?? this.diaSemana,
      descanso: descanso ?? this.descanso,
      exercicios: exercicios
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Treino && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
