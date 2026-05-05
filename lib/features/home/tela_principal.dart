import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projeto_sistemas_moveis/widgets/custom_bottom_nav.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  static const treino = [
    {
      "nome": "Treino A",
      "tipo": "Push",
      "exercicios": ["Supino Reto", "Desenvolvimento", "Supino Inclinado"],
    },
    {
      "nome": "Treino B",
      "tipo": "Pull",
      "exercicios": ["Puxada Alta", "Remada", "Rosca Bíceps"],
    },
    {
      "nome": "Treino C",
      "tipo": "Legs",
      "exercicios": ["Agachamento", "Leg Press", "Extensora"],
    },
    {
      "nome": "Descanso",
      "tipo": "Legs",
      "exercicios": ["Agachamento", "Leg Press", "Extensora"],
    },
    {
      "nome": "Treino D",
      "tipo": "Upper",
      "exercicios": ["Supino", "Remada", "Desenvolvimento", "Barra Fixa"],
    },
    {
      "nome": "Treino E",
      "tipo": "Lower",
      "exercicios": ["Stiff", "Cadeira Flexora", "Afundo", "Panturrilha"],
    },
    {
      "nome": "Descanso",
      "tipo": "Legs",
      "exercicios": ["Agachamento", "Leg Press", "Extensora"],
    },
  ];

  static const divisoes = [
    {
      "titulo": "ABC",
      "descricao": "Divisão simples onde cada dia foca em um grupo muscular.",
    },
    {
      "titulo": "ABCD ou ABCDE",
      "descricao":
          "Treinos mais divididos, ideal para foco específico por músculo.",
    },
    {
      "titulo": "Push/Pull/Legs",
      "descricao": "Separa empurrar, puxar e pernas para melhor recuperação.",
    },
    {
      "titulo": "Upper/Lower",
      "descricao": "Divide o treino entre parte superior e inferior do corpo.",
    },
    {
      "titulo": "Full Body",
      "descricao": "Treina o corpo todo em cada sessão, ideal para iniciantes.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarPersonalizada(currentIndex: 1),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              // toolbarHeight: 150,
              backgroundColor: Colors.black,
              // pinned: true,
              // floating: true,
              // snap: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                title: Text(
                  'Terça-feira, o que vamos treinar hoje?',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                    Container(color: Colors.black.withValues(alpha: 0.6)),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: double.infinity,
                        color: Colors.black,
                        child: SafeArea(
                          bottom: false,
                          child: ListTile(
                            // Perfil
                            leading: GestureDetector(
                              onTap: () => context.push('/perfil'),
                              child: CircleAvatar(child: Icon(Icons.person)),
                            ),
                            title: Text(
                              "Bem-vindo!",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "Usuário",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Notificação
                            trailing: IconButton(
                              hoverColor: Colors.white,
                              onPressed: () {
                                // context.push('/notificacao');
                                // context.push('/login');
                              },
                              icon: Icon(
                                Icons.notifications_outlined,
                                size: 26,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 16, bottom: 8),
                child: Text(
                  "Seus treinos",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = treino[index];

                return Card(
                  child: ExpansionTile(
                    title: Text(item["nome"] as String),
                    subtitle: Text(item["tipo"] as String),
                    children: (item["exercicios"] as List<String>)
                        .map((e) => ListTile(title: Text(e)))
                        .toList(),
                  ),
                );
              }, childCount: treino.length),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 16, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Descubra mais",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: divisoes.map((item) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 200,
                              margin: EdgeInsets.only(right: 12),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item["titulo"]!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    item["descricao"]!,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Conhecer',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
