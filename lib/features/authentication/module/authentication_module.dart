import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:tcc/features/authentication/presentation/pages/authentication_page.dart';
import 'package:tcc/features/authentication/presentation/pages/initial_page.dart';

class AuthenticationModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => AuthenticationCubit())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => BlocProvider(
                  create: (context) => Modular.get<AuthenticationCubit>(),
                  child: const InitialPage(),
                )),
        ChildRoute('/authpage',
            child: (context, args) => BlocProvider(
                  create: (context) => Modular.get<AuthenticationCubit>(),
                  child: const AuthenticationPage(),
                ))
      ];
}
