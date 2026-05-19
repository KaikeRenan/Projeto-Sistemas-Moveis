import 'enums.dart';

class Exercicio {
  final String id;
  final String nome;
  final GrupoMuscular grupoMuscular;

  Exercicio({
    required this.id,
    required this.nome,
    required this.grupoMuscular,
  });

  factory Exercicio.fromJson(Map<String, dynamic> json) {
    return Exercicio(
      id: json['id'] as String,
      nome: json['nome'] as String,
      grupoMuscular: GrupoMuscular.values.byName(
        json['grupo_muscular'] as String,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nome': nome, 'grupo_muscular': grupoMuscular.name};
  }

  Exercicio copyWith({String? id, String? nome, GrupoMuscular? grupoMuscular}) {
    return Exercicio(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      grupoMuscular: grupoMuscular ?? this.grupoMuscular,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Exercicio && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
