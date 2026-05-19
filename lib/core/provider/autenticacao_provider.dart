import 'package:flutter/material.dart';
import 'package:projeto_sistemas_moveis/features/autenticacao/domain/models/usuario.dart';

class AutenticacaoProvider extends ChangeNotifier {
  bool _carregando = false;
  bool get carregando => _carregando;

  Usuario? _usuario;
  Usuario? get usuario => _usuario;

  bool get autenticado => _usuario != null;

  Future<void> login({required String email, required String senha}) async {
    _carregando = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));

      _usuario = Usuario(
        id: '1',
        nomeCompleto: 'Kaike Renan',
        email: email,
        ativo: true,
        criadoEmStr: DateTime.now().toIso8601String(),
      );
    } finally {
      _carregando = false;
      notifyListeners();
    }
  }

  void logout() {
    _usuario = null;
    notifyListeners();
  }
}
