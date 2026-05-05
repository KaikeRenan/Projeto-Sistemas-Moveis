import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projeto_sistemas_moveis/core/utils/validators.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _senhaConfirmacaoController = TextEditingController();

  final _emailFocus = FocusNode();
  final _senhaFocus = FocusNode();
  final _senhaConfirmacaoFocus = FocusNode();

  bool _carregando = false;

  bool _senhaVisivel = false;
  bool _senhaConfirmacaoVisivel = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _senhaConfirmacaoController.dispose();
    _emailFocus.dispose();
    _senhaFocus.dispose();
    _senhaConfirmacaoFocus.dispose();
    super.dispose();
  }

  Future<bool> _submeterCadastro() async {
    if (!_formKey.currentState!.validate()) return false;

    FocusScope.of(context).unfocus();

    setState(() {
      _carregando = true;
    });

    try {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cadastro realizado com sucesso!'),
            backgroundColor: Colors.deepPurpleAccent,
          ),
        );
      }
      return true;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao cadastrar: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return false;
    } finally {
      if (mounted) {
        setState(() => _carregando = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        color: Colors.black,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                "Digite os dados nos campos abaixo para criar sua conta.",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 30),
              // Campo Nome Completo
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Digite seu nome completo",
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocus);
                },
                validator: Validadores.nomeCompleto,
              ),
              SizedBox(height: 10),

              // Campo Email
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocus,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Digite seu email",
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_senhaFocus);
                },
                validator: Validadores.email,
              ),
              SizedBox(height: 10),

              // Campo Senha
              TextFormField(
                controller: _senhaController,
                focusNode: _senhaFocus,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Digite sua senha",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _senhaVisivel ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () =>
                        setState(() => _senhaVisivel = !_senhaVisivel),
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                obscureText: !_senhaVisivel,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_senhaConfirmacaoFocus),
                validator: Validadores.senha,
              ),
              SizedBox(height: 10),

              // Campo Confirmar Senha
              TextFormField(
                controller: _senhaConfirmacaoController,
                focusNode: _senhaConfirmacaoFocus,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Confirme sua senha",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _senhaConfirmacaoVisivel
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () => setState(
                      () =>
                          _senhaConfirmacaoVisivel = !_senhaConfirmacaoVisivel,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                obscureText: !_senhaConfirmacaoVisivel,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _submeterCadastro(),
                validator: (value) =>
                    Validadores.confirmarSenha(_senhaController.text)(value),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.all(17),
                  ),
                  onPressed: _carregando
                      ? null
                      : () async {
                          final sucesso = await _submeterCadastro();
                          if (sucesso) {
                            context.go('/login');
                          }
                        },
                  child: _carregando
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "Criar conta",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
