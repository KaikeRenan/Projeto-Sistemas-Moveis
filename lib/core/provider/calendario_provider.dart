import 'package:flutter/material.dart';

class CalendarioProvider extends ChangeNotifier {
  DateTime _hoje = DateTime.now();
  DateTime get hoje => _hoje;

  DateTime? _diaSelecionado;
  DateTime? get diaSelecionado => _diaSelecionado;

  void selecionarDia(DateTime diaSelecionado, DateTime hoje) {
    _diaSelecionado = diaSelecionado;
    _hoje = hoje;

    notifyListeners();
  }

  void limparSelecao() {
    _diaSelecionado = null;

    notifyListeners();
  }
}
