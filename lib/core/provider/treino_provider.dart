import 'package:flutter/material.dart';
import 'package:projeto_sistemas_moveis/features/autenticacao/domain/models/enums.dart';

import '../../features/autenticacao/domain/models/treino.dart';

class TreinoProvider extends ChangeNotifier {
  final List<Treino> _treinos = [
    Treino(
      id: '1',
      nome: 'Treino A',
      diaSemana: DiaSemana.Segunda,
      descanso: false,
      exercicios: ['Supino Reto', 'Desenvolvimento', 'Supino Inclinado'],
    ),
    Treino(
      id: '2',
      nome: 'Treino B',
      diaSemana: DiaSemana.Terca,
      descanso: false,
      exercicios: ['Puxada Alta', 'Remada Curvada', 'Rosca Scott'],
    ),
  ];

  List<Treino> get treinos => _treinos;

  void adicionarTreino(Treino treino) {
    _treinos.add(treino);

    notifyListeners();
  }

  void removerTreino(String id) {
    _treinos.removeWhere((treino) => treino.id == id);

    notifyListeners();
  }
}
