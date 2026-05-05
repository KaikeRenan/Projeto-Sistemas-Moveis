import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projeto_sistemas_moveis/core/auth/auth_service.dart';
import 'package:projeto_sistemas_moveis/core/utils/validators.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final _emailFocus = FocusNode();
  final _senhaFocus = FocusNode();

  bool _carregando = false;

  bool _senhaVisivel = false;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _emailFocus.dispose();
    _senhaFocus.dispose();
    super.dispose();
  }

  Future<bool> _submeterLogin() async {
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
            content: Text('Acesso à conta realizado com sucesso!'),
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
      // appBar: AppBar(
      // title: const Image(image: NetworkImage("https://www.flaticon.com/br/icone-gratis/haltere_563879?related_id=563828&origin=search"),),
      // title: const Text('Bem-vindo!'),
      // centerTitle: true,
      // titleTextStyle: TextStyle(color: Colors.white),
      // backgroundColor: Colors.transparent,
      // elevation: 0,
      // ),
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient (
        //     colors: [Colors.black, Colors.deepPurple],
        //   ),
        // ),
        padding: const EdgeInsets.all(50),
        color: Colors.black,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                "Digite os dados de acesso nos campos abaixo.",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 30),
              // Campo Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Digite seu e-mail",
                  helperText: "Ex: email@gmail.com",
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
                // maxLength: 50
              ),
              SizedBox(height: 10),
              // Campo Senha
              TextFormField(
                controller: _senhaController,
                focusNode: _senhaFocus,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: "Digite sua senha",
                  helperText: "Ex: senha123",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _senhaVisivel ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () =>
                        setState(() => _senhaVisivel = !_senhaVisivel),
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                obscureText: !_senhaVisivel,
                textInputAction: TextInputAction.done,
                validator: Validadores.senha,
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
                          final sucesso = await _submeterLogin();
                          if (sucesso) {
                            servicoAuth.login();
                            context.go('/');
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
                          "Acessar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 0.8),
                    padding: const EdgeInsets.all(17),
                  ),
                  child: const Text(
                    "Crie sua conta",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    context.go('/cadastro');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
