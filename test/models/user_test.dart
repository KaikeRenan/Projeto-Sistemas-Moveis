import 'package:flutter_test/flutter_test.dart';
import 'package:Projeto-Sistemas-Moveis/frontend/lib/features/autenticacao/domain/models/user.dart';

void main() {

  final json = {
    "id": "usr1",
    "name_full": "Ana Lima",
    "email": "ana@email.com",
    "active": true,
    "created_in": "2024-09-15T10:30:00Z"
  };

  test('fromJson cria objeto corretamente', () {
    final user = User.fromJson(json);

    expect(user.id, "usr1");
    expect(user.nameFull, "Ana Lima");
    expect(user.email, "ana@email.com");
    expect(user.active, true);
  });

  test('toJson gera json correto', () {
    final user = User.fromJson(json);

    final result = user.toJson();

    expect(result['id'], "usr1");
    expect(result['name_full'], "Ana Lima");
    expect(result['email'], "ana@email.com");
  });

  test('copyWith modifica apenas campos informados', () {
    final user = User.fromJson(json);

    final updated = user.copyWith(
      email: "novo@email.com",
    );

    expect(updated.email, "novo@email.com");
    expect(updated.nameFull, user.nameFull);
    expect(updated.id, user.id);
  });

}