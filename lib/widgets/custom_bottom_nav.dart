import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarPersonalizada extends StatelessWidget {
  final int currentIndex;

  const BottomNavigationBarPersonalizada({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final rotas = ['/novoTreino', '/', '/calendario'];

    return BottomNavigationBar(
      // backgroundColor: Colors.black,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.black,
      currentIndex: currentIndex,
      onTap: (index) {
        context.go(rotas[index]);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Adicionar Treino",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Página Inicial",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: "Calendário",
        ),
      ],
    );
  }
}
