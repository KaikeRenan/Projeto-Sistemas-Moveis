import 'package:get_it/get_it.dart';
import 'package:projeto_sistemas_moveis/core/provider/autenticacao_provider.dart';
import 'package:projeto_sistemas_moveis/core/provider/calendario_provider.dart';
import 'package:projeto_sistemas_moveis/core/provider/treino_provider.dart';
import 'package:projeto_sistemas_moveis/core/provider/usuario_provider.dart';

final getIt = GetIt.instance;

void setupLocator() {

  getIt.registerLazySingleton<AutenticacaoProvider>(
    () => AutenticacaoProvider(),
  );

  getIt.registerLazySingleton<TreinoProvider>(
    () => TreinoProvider(),
  );

  getIt.registerLazySingleton<UsuarioProvider>(
    () => UsuarioProvider(),
  );

  getIt.registerLazySingleton<CalendarioProvider>(
    () => CalendarioProvider(),
  );
}