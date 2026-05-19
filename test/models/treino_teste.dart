import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_sistemas_moveis/features/autenticacao/domain/models/treino.dart';
import 'package:projeto_sistemas_moveis/features/autenticacao/domain/models/enums.dart';

void main() {
  final json = {
    "id": "w1",
    "nome": "Treino Peito",
    "dia_semana": "segunda",
    "descanso": false,
  };

  test('fromJson cria objeto corretamente', () {
    final treino = Treino.fromJson(json);

    expect(treino.id, "w1");
    expect(treino.nome, "Treino Peito");
    expect(treino.diaSemana, DiaSemana.Segunda);
  });

  test('toJson gera json correto', () {
    final treino = Treino.fromJson(json);

    final resultado = treino.toJson();

    expect(resultado['id'], "w1");
    expect(resultado['nome'], "Treino Peito");
    expect(resultado['dia_semana'], "segunda");
  });

  test('copyWith modifica apenas campos informados', () {
    final treino = Treino.fromJson(json);

    final atualizado = treino.copyWith(nome: "Treino Costas");

    expect(atualizado.nome, "Treino Costas");
    expect(atualizado.diaSemana, treino.diaSemana);
  });
}
