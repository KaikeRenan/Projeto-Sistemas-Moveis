import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_sistemas_moveis/features/autenticacao/domain/models/exercicio.dart';
import 'package:projeto_sistemas_moveis/features/autenticacao/domain/models/enums.dart';

void main() {
  final json = {"id": "ex1", "nome": "Supino", "grupo_muscular": "peito"};

  test('fromJson cria objeto corretamente', () {
    final exercicio = Exercicio.fromJson(json);

    expect(exercicio.id, "ex1");
    expect(exercicio.nome, "Supino");
    expect(exercicio.grupoMuscular, GrupoMuscular.peito);
  });

  test('toJson gera json correto', () {
    final exercicio = Exercicio.fromJson(json);

    final resultado = exercicio.toJson();

    expect(resultado['id'], "ex1");
    expect(resultado['nome'], "Supino");
    expect(resultado['grupo_muscular'], "peito");
  });

  test('copyWith modifica apenas campos informados', () {
    final exercicio = Exercicio.fromJson(json);

    final atualizado = exercicio.copyWith(nome: "Supino Inclinado");

    expect(atualizado.nome, "Supino Inclinado");
    expect(atualizado.grupoMuscular, exercicio.grupoMuscular);
  });
}
