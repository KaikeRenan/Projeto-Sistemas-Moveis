import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_sistemas_moveis/features/autenticacao/domain/models/usuario.dart';

void main() {
  final json = {
    "id": "usr1",
    "nome_completo": "Ana Lima",
    "email": "ana@email.com",
    "ativo": true,
    "criado_em": "2024-09-15T10:30:00Z",
  };

  test('fromJson cria objeto corretamente', () {
    final usuario = Usuario.fromJson(json);

    expect(usuario.id, "usr1");
    expect(usuario.nomeCompleto, "Ana Lima");
    expect(usuario.email, "ana@email.com");
    expect(usuario.ativo, true);
  });

  test('toJson gera json correto', () {
    final usuario = Usuario.fromJson(json);

    final resultado = usuario.toJson();

    expect(resultado['id'], "usr1");
    expect(resultado['nome_completo'], "Ana Lima");
    expect(resultado['email'], "ana@email.com");
  });

  test('copyWith modifica apenas campos informados', () {
    final usuario = Usuario.fromJson(json);

    final atualizado = usuario.copyWith(email: "novo@email.com");

    expect(atualizado.email, "novo@email.com");
    expect(atualizado.nomeCompleto, usuario.nomeCompleto);
    expect(atualizado.id, usuario.id);
  });
}
