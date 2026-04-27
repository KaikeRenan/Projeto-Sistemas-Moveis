import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class ServicoAuth extends ChangeNotifier {
  bool _autenticado = false;
  bool get autenticado => _autenticado;

  void login() {
    _autenticado = true;
    notifyListeners();
  }

  void logout() {
    _autenticado = false;
    notifyListeners();
  }
}

final servicoAuth = ServicoAuth();

final GoRouter _roteador = GoRouter(
  initialLocation: '/',
  refreshListenable: servicoAuth,
  redirect: (_, state) {
    final logado = servicoAuth.autenticado;
    final indoParaLogin = state.matchedLocation == '/login';
    if (!logado && !indoParaLogin) return '/login';
    if (logado && indoParaLogin) return '/';
    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => const TelaPrincipal()),
    GoRoute(
      path: '/novoTreino',
      builder: (context, state) => const TelaNovoTreino(),
    ),
    GoRoute(
      path: '/calendario',
      builder: (context, state) => const TelaCalendario(),
    ),
    GoRoute(
      path: '/saibaMais',
      builder: (context, state) => const TelaSaibaMais(),
    ),
    GoRoute(path: '/login', builder: (context, state) => const TelaLogin()),
    GoRoute(path: '/perfil', builder: (context, state) => const TelaPerfil()),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GymApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routerConfig: _roteador,
    );
  }
}

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) context.go('/novoTreino');
        if (index == 1) context.go('/');
        if (index == 2) context.go('/calendario');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(currentIndex: 1),
      // BottomNavigationBar(
      //   onTap: (index) {
      //     if (index == 0) {
      //       context.go('/novoTreino');
      //     } else if (index == 2) {
      //       context.go('/calendario');
      //     }
      //   },
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add, color: Colors.black),
      //       label: "Adicionar Treino",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home, color: Colors.black),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.calendar_today, color: Colors.black),
      //       label: "Calendário",
      //     ),
      //   ],
      //   // selectedItemColor: Colors.deepPurple,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                padding: const EdgeInsets.only(left: 16, top: 32, bottom: 16),
                child: Text(
                  "Seus treinos:",
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
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      size: 64,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Aprenda mais sobre treinos",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Conheça mais sobre",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    TextButton(
                      onPressed: () {
                        context.push('/saibaMais');
                      },
                      child: Text(
                        "Saiba mais",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    // SizedBox(height: 80),
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
      bottomNavigationBar: CustomBottomNav(currentIndex: 0),
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

class TelaCalendario extends StatefulWidget {
  const TelaCalendario({super.key});

  @override
  State<TelaCalendario> createState() => _TelaCalendarioState();
}

class _TelaCalendarioState extends State<TelaCalendario> {
  DateTime _hoje = DateTime.now();
  DateTime? _diaSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendário'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0))),
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: 2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TableCalendar(
          firstDay: DateTime.utc(2026, 01, 01),
          lastDay: DateTime.utc(2026, 12, 31),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.deepPurple),
          ),
          calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(color: Colors.deepPurple),
            selectedDecoration: BoxDecoration(color: Colors.purple),
          ),
          focusedDay: _hoje,
          selectedDayPredicate: (day) => isSameDay(_diaSelecionado, day),
          onDaySelected: _onDaySelected,
        ),
      ),
    );
  }

  void _onDaySelected(DateTime diaSelecionado, DateTime hoje) {
    if (!isSameDay(_diaSelecionado, diaSelecionado)) {
      setState(() {
        _diaSelecionado = diaSelecionado;
        _hoje = hoje;
      });
    }
  }
}

class TelaSaibaMais extends StatelessWidget {
  const TelaSaibaMais({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mais sobre treinamento'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            "Lorem Ipsum 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...' 'There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pulvinar cursus nulla, id interdum enim mollis sit amet. Nunc vehicula mauris ut lorem mollis, vulputate fringilla ex bibendum. Praesent imperdiet tellus et lectus gravida, at congue lorem laoreet. Pellentesque id enim diam. Maecenas rhoncus commodo ipsum a egestas. Donec rhoncus tortor libero, eget tempus massa consequat sed. In risus mauris, finibus sed augue sed, luctus pulvinar turpis. Vestibulum sem est, commodo a rutrum et, scelerisque malesuada mauris. Vestibulum porta massa non lacus malesuada sollicitudin iaculis at diam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur elementum elit vitae ante ullamcorper posuere. In hac habitasse platea dictumst. Integer quis diam tincidunt, porta mauris vitae, sodales felis. Aliquam erat volutpat. Vestibulum aliquet imperdiet lorem, a commodo tellus hendrerit quis. Cras posuere ex non erat interdum rutrum. Mauris non pulvinar nisl. Nam euismod consequat vulputate. Donec risus lectus, lacinia ornare dolor vel, facilisis feugiat mi. Maecenas mollis, nisi id ullamcorper mollis, risus enim sodales arcu, sed accumsan ex arcu ac neque. Aenean ex erat, efficitur eget molestie ut, consectetur at mauris. Nam egestas libero sit amet risus varius dictum. Quisque ac pretium nisi. Morbi at magna sapien. Fusce aliquam dolor eros, ac bibendum nisi scelerisque vitae. Proin nec elit sagittis, sagittis urna id, posuere mauris. Curabitur sit amet dignissim libero. Nam faucibus laoreet est ut bibendum. Curabitur at ligula ut nisl laoreet posuere sagittis et turpis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut tempor est magna, nec euismod leo finibus a. Donec dictum tortor at sodales imperdiet. Nunc ut ipsum efficitur, dignissim odio sed, euismod mi. Cras ornare luctus ex eget faucibus. In mollis nunc eget euismod viverra. Fusce et erat quam. Nulla tempus eros vitae dolor iaculis accumsan. Duis in nisl ut nisl placerat condimentum sed eu urna. Cras eros ex, sagittis et sapien nec, porta varius mi. Nam pretium ac elit ac sollicitudin. Maecenas eu dolor in massa ullamcorper venenatis sed at mi. Donec vitae cursus neque, nec elementum elit. Integer vitae rutrum ex. Nulla aliquam leo elit, non tristique est luctus in. Ut tempus dignissim lectus, in luctus urna sodales ac. Aenean ut tristique justo. Nulla quis vulputate sem. Integer tincidunt mauris sit amet enim tristique hendrerit. Nam et nisl efficitur, condimentum leo et, euismod enim. Cras lobortis gravida orci, vitae varius felis ullamcorper non. Etiam ultrices nibh eget est condimentum egestas fringilla sed nisl. Proin et elit at urna volutpat luctus. Praesent quis vehicula velit. Sed sodales libero interdum dictum pulvinar. Donec varius malesuada quam sit amet iaculis. Generated 5 paragraphs, 428 words, 2820 bytes of Lorem Ipsum",
          ),
        ),
      ),
    );
  }
}

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: const Image(image: NetworkImage("https://www.flaticon.com/br/icone-gratis/haltere_563879?related_id=563828&origin=search"),),
        title: const Text('Login'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: SweepGradient  (
        //     colors: [Colors.deepPurple, Colors.black],
        //   ),
        // ),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(50),
        color: Colors.deepPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              "Digite os dados de acesso nos campos abaixo.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 30),
            CupertinoTextField(
              padding: EdgeInsets.all(10),
              placeholder: "Digite o seu e-mail",
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white70, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            SizedBox(height: 5),
            CupertinoTextField(
              padding: EdgeInsets.all(10),
              placeholder: "Digite sua senha",
              obscureText: true,
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white70, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: const EdgeInsets.all(17),
                color: Colors.pink,
                child: const Text(
                  "Acessar",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  servicoAuth.login();
                  context.go('/');
                },
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white70, width: 0.8),
                borderRadius: BorderRadius.circular(7),
              ),
              child: CupertinoButton(
                child: const Text(
                  "Crie sua conta",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  servicoAuth.login();
                  context.go('/');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            "Lorem Ipsum Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
          ),
        ),
      ),
    );
  }
}
