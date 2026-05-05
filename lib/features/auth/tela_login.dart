import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projeto_sistemas_moveis/core/auth/auth_service.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

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
              // maxLength: 50
            ),
            SizedBox(height: 10),
            // Campo Senha
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Digite sua senha",
                helperText: "Ex: senha123",
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: const EdgeInsets.all(17),
                ),
                child: const Text(
                  "Acessar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  servicoAuth.login();
                  context.go('/');
                },
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
    );
  }
}
