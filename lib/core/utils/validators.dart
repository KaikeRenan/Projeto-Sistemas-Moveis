class Validadores {
  Validadores._();

  static String? obrigatorio(String? v, {String campo = 'Este campo'}) =>
      (v == null || v.trim().isEmpty) ? '$campo é obrigatório' : null;

  static String? nomeCompleto(String? v) {
    final err = obrigatorio(v, campo: 'O nome');
    if (err != null) return err;
    return v!.trim().split(' ').where((p) => p.isNotEmpty).length < 2
        ? 'Informe nome e sobrenome'
        : null;
  }

  static String? email(String? v) {
    final err = obrigatorio(v, campo: 'O e-mail');
    if (err != null) return err;
    return RegExp(
          r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$',
        ).hasMatch(v!.trim())
        ? null
        : 'Informe um e-mail válido';
  }

  static String? telefone(String? v) {
    final err = obrigatorio(v, campo: 'O telefone');
    if (err != null) return err;
    final d = v!.replaceAll(RegExp(r'\D'), '');
    return (d.length < 10 || d.length > 11)
        ? 'Informe um telefone válido com DDD'
        : null;
  }

  static String? senha(String? v) {
    final err = obrigatorio(v, campo: 'A senha');
    if (err != null) return err;
    if (v!.length < 8) return 'Mínimo 8 caracteres';
    if (!v.contains(RegExp(r'[A-Z]'))) return 'Inclua uma letra maiúscula';
    if (!v.contains(RegExp(r'[0-9]'))) return 'Inclua um número';
    return null;
  }

  static String? Function(String?) confirmarSenha(String original) =>
      (v) => (v != original) ? 'As senhas não coincidem' : obrigatorio(v);
}
