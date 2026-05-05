import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_sistemas_moveis/features/autenticacao/domain/models/workout.dart';
import 'package:projeto_sistemas_moveis/features/autenticacao/domain/models/enums.dart';


void main() {

  final json = {
    "id": "w1",
    "name": "Treino Peito",
    "day_week": "segunda",
    "rest": false
  };

  test('fromJson cria objeto corretamente', () {
    final workout = Workout.fromJson(json);

    expect(workout.id, "w1");
    expect(workout.name, "Treino Peito");
    expect(workout.dayWeek, DayWeek.segunda);
  });

  test('toJson gera json correto', () {
    final workout = Workout.fromJson(json);

    final result = workout.toJson();

    expect(result['id'], "w1");
    expect(result['name'], "Treino Peito");
    expect(result['day_week'], "segunda");
  });

  test('copyWith modifica apenas campos informados', () {
    final workout = Workout.fromJson(json);

    final updated = workout.copyWith(
      name: "Treino Costas",
    );

    expect(updated.name, "Treino Costas");
    expect(updated.dayWeek, workout.dayWeek);
  });

}