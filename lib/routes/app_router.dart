import 'package:go_router/go_router.dart';
import 'package:projeto_sistemas_moveis/core/auth/auth_service.dart';
import 'package:projeto_sistemas_moveis/features/auth/tela_cadastro.dart';
import 'package:projeto_sistemas_moveis/features/auth/tela_login.dart';
import 'package:projeto_sistemas_moveis/features/calendario/tela_calendario.dart';
import 'package:projeto_sistemas_moveis/features/home/tela_principal.dart';
import 'package:projeto_sistemas_moveis/features/perfil/tela_perfil.dart';
import 'package:projeto_sistemas_moveis/features/saiba_mais/tela_saiba_mais.dart';
import 'package:projeto_sistemas_moveis/features/treino/tela_novo_treino.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  refreshListenable: servicoAuth,
  redirect: (_, state) {
    final logado = servicoAuth.autenticado;
    final indoParaLogin = state.matchedLocation == '/login';
    final indoParaCadastro = state.matchedLocation == '/cadastro';

    if (!logado && !(indoParaLogin || indoParaCadastro)) return '/login';
    if (logado && (indoParaLogin || indoParaCadastro)) return '/';

    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (_, __) => const TelaPrincipal()),
    GoRoute(path: '/novoTreino', builder: (_, __) => const TelaNovoTreino()),
    GoRoute(path: '/calendario', builder: (_, __) => const TelaCalendario()),
    GoRoute(path: '/saibaMais', builder: (_, __) => const TelaSaibaMais()),
    GoRoute(path: '/login', builder: (_, __) => const TelaLogin()),
    GoRoute(path: '/cadastro', builder: (_, __) => const TelaCadastro()),
    GoRoute(path: '/perfil', builder: (_, __) => const TelaPerfil()),
  ],
);
