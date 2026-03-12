import 'package:flutter_test/flutter_test.dart';
import 'package:Projeto-Sistemas-Moveis/frontend/lib/features/autenticacao/domain/models/exercise.dart';
import 'package:Projeto-Sistemas-Moveis/frontend/lib/features/autenticacao/domain/models/enums.dart';

void main() {

  final json = {
    "id": "ex1",
    "name": "Supino",
    "muscular_group": "peito"
  };

  test('fromJson cria objeto corretamente', () {
    final exercise = Exercise.fromJson(json);

    expect(exercise.id, "ex1");
    expect(exercise.name, "Supino");
    expect(exercise.muscularGroup, MuscularGroup.peito);
  });

  test('toJson gera json correto', () {
    final exercise = Exercise.fromJson(json);

    final result = exercise.toJson();

    expect(result['id'], "ex1");
    expect(result['name'], "Supino");
    expect(result['muscular_group'], "peito");
  });

  test('copyWith modifica apenas campos informados', () {
    final exercise = Exercise.fromJson(json);

    final updated = exercise.copyWith(
      name: "Supino Inclinado",
    );

    expect(updated.name, "Supino Inclinado");
    expect(updated.muscularGroup, exercise.muscularGroup);
  });

}