import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_sistemas_moveis/features/autenticacao/domain/models/serie_treino.dart';

void main() {
  final json = {
    "id": "s1",
    "repeticoes": 10,
    "carga": 50.0,
    "descanso_segundos": 60,
  };

  test('fromJson cria objeto corretamente', () {
    final serie = SerieTreino.fromJson(json);

    expect(serie.id, "s1");
    expect(serie.repeticoes, 10);
    expect(serie.carga, 50.0);
    expect(serie.descansoSegundos, 60);
  });

  test('toJson gera json correto', () {
    final serie = SerieTreino.fromJson(json);

    final resultado = serie.toJson();

    expect(resultado['id'], "s1");
    expect(resultado['repeticoes'], 10);
    expect(resultado['carga'], 50.0);
  });

  test('copyWith modifica apenas campos informados', () {
    final serie = SerieTreino.fromJson(json);

    final atualizado = serie.copyWith(carga: 60.0);

    expect(atualizado.carga, 60.0);
    expect(atualizado.repeticoes, serie.repeticoes);
  });
}
