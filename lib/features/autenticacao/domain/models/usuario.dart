class Usuario {
  final String id;
  final String nomeCompleto;
  final String email;
  final bool ativo;
  final DateTime criadoEm;

  Usuario({
    required this.id,
    required this.nomeCompleto,
    required this.email,
    required this.ativo,
    required String criadoEmStr,
  }) : criadoEm = DateTime.parse(criadoEmStr);

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'] as String,
      nomeCompleto: json['nome_completo'] as String,
      email: json['email'] as String,
      ativo: json['ativo'] as bool,
      criadoEmStr: json['criado_em'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome_completo': nomeCompleto,
      'email': email,
      'ativo': ativo,
      'criado_em': criadoEm.toIso8601String(),
    };
  }

  Usuario copyWith({
    String? id,
    String? nomeCompleto,
    String? email,
    bool? ativo,
  }) {
    return Usuario(
      id: id ?? this.id,
      nomeCompleto: nomeCompleto ?? this.nomeCompleto,
      email: email ?? this.email,
      ativo: ativo ?? this.ativo,
      criadoEmStr: criadoEm.toIso8601String(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Usuario &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email;

  @override
  int get hashCode => id.hashCode ^ email.hashCode;

  @override
  String toString() {
    return 'Usuario(id: $id, nomeCompleto: $nomeCompleto, email: $email, ativo: $ativo, criadoEm: $criadoEm)';
  }
}
