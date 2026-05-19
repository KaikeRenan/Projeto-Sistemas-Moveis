import 'package:flutter/material.dart';
import 'package:projeto_sistemas_moveis/features/autenticacao/domain/models/usuario.dart';

class UsuarioProvider extends ChangeNotifier {
  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  void definirUsuario(Usuario usuario) {
    _usuario = usuario;
    notifyListeners();
  }

  void atualizarNome(String nome) {
    if (_usuario == null) return;

    _usuario = _usuario!.copyWith(nomeCompleto: nome);

    notifyListeners();
  }

  void atualizarEmail(String email) {
    if (_usuario == null) return;

    _usuario = _usuario!.copyWith(email: email);

    notifyListeners();
  }

  void limparUsuario() {
    _usuario = null;
    notifyListeners();
  }
}
