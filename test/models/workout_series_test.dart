import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_sistemas_moveis/features/autenticacao/domain/models/workout_series.dart';

void main() {

  final json = {
    "id": "s1",
    "repetitions": 10,
    "load": 50.0,
    "rest_seconds": 60
  };

  test('fromJson cria objeto corretamente', () {
    final serie = WorkoutSeries.fromJson(json);

    expect(serie.id, "s1");
    expect(serie.repetitions, 10);
    expect(serie.load, 50.0);
    expect(serie.restSeconds, 60);
  });

  test('toJson gera json correto', () {
    final serie = WorkoutSeries.fromJson(json);

    final result = serie.toJson();

    expect(result['id'], "s1");
    expect(result['repetitions'], 10);
    expect(result['load'], 50.0);
  });

  test('copyWith modifica apenas campos informados', () {
    final serie = WorkoutSeries.fromJson(json);

    final updated = serie.copyWith(
      load: 60.0,
    );

    expect(updated.load, 60.0);
    expect(updated.repetitions, serie.repetitions);
  });

}