class SerieTreino {
  final String id;
  final int repeticoes;
  final double carga;
  final int descansoSegundos;

  SerieTreino({
    required this.id,
    required this.repeticoes,
    required this.carga,
    required this.descansoSegundos,
  });

  factory SerieTreino.fromJson(Map<String, dynamic> json) {
    return SerieTreino(
      id: json['id'] as String,
      repeticoes: json['repeticoes'] as int,
      carga: (json['carga'] as num).toDouble(),
      descansoSegundos: json['descanso_segundos'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'repeticoes': repeticoes,
      'carga': carga,
      'descanso_segundos': descansoSegundos,
    };
  }

  SerieTreino copyWith({
    String? id,
    int? repeticoes,
    double? carga,
    int? descansoSegundos,
  }) {
    return SerieTreino(
      id: id ?? this.id,
      repeticoes: repeticoes ?? this.repeticoes,
      carga: carga ?? this.carga,
      descansoSegundos: descansoSegundos ?? this.descansoSegundos,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SerieTreino &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
