import 'package:flutter/material.dart';
import 'package:projeto_sistemas_moveis/widgets/custom_bottom_nav.dart';

class TelaNovoTreino extends StatelessWidget {
  const TelaNovoTreino({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crie seu treino'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBarPersonalizada(currentIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text("Novo treino"),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Digite o nome do treino",
                        ),
                      ),
                      SizedBox(),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Digite o tipo do treino",
                        ),
                      ),
                      SizedBox(),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Selecione os exercícios",
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(onPressed: () {}, child: Text("Salvar")),
                          TextButton(onPressed: () {}, child: Text("Cancelar")),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
