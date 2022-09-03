import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/features/authentication/data/datasources/authentication_datasource_impl.dart';
import 'package:tcc/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:tcc/features/authentication/domain/usecases/login_with_email_and_password_use_case.dart';
import 'package:tcc/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:tcc/features/authentication/presentation/pages/authentication_page.dart';
import 'package:tcc/features/authentication/presentation/pages/initial_page.dart';

class AuthenticationModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) =>
            AuthenticationDataSourceImpl(firebaseAuth: FirebaseAuth.instance)),
        Bind.singleton((i) => AuthenticationRepositoryImpl(
            authenticationDataSourceAbstract:
                Modular.get<AuthenticationDataSourceImpl>())),
        Bind.singleton((i) => LoginWithEmailAndPasswordUseCase(
            authenticationRepositoryAbstract:
                Modular.get<AuthenticationRepositoryImpl>())),
        Bind.singleton((i) => AuthenticationCubit(
            loginWithEmailAndPasswordUseCase:
                Modular.get<LoginWithEmailAndPasswordUseCase>()))
      ];

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
