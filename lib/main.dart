import 'package:flutter/material.dart';
import 'package:projeto_sistemas_moveis/core/di/injecao.dart';
import 'package:projeto_sistemas_moveis/core/provider/autenticacao_provider.dart';
import 'package:projeto_sistemas_moveis/core/provider/calendario_provider.dart';
import 'package:projeto_sistemas_moveis/core/provider/treino_provider.dart';
import 'package:projeto_sistemas_moveis/core/provider/usuario_provider.dart';
import 'package:projeto_sistemas_moveis/routes/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AutenticacaoProvider>(
          create: (_) => getIt<AutenticacaoProvider>(),
        ),

        ChangeNotifierProvider<TreinoProvider>(
          create: (_) => getIt<TreinoProvider>(),
        ),

        ChangeNotifierProvider<UsuarioProvider>(
          create: (_) => getIt<UsuarioProvider>(),
        ),

        ChangeNotifierProvider<CalendarioProvider>(
          create: (_) => getIt<CalendarioProvider>(),
        ),
      ],

      child: MaterialApp.router(
        title: 'GymApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        routerConfig: appRouter,
      ),
    );
  }
}
