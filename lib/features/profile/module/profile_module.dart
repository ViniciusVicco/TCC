import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/config/firebase/firebase_instances.dart';
import 'package:tcc/core/session/session_manager.dart';
import 'package:tcc/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:tcc/features/profile/presentation/pages/profile_page.dart';

class ProfileModule extends Module {
  ProfileModule();
  @override
  List<Bind> get binds => [
        // Bind.factory((i) => AuthenticationDataSourceImpl(
        //     firebaseAuth:
        //         Modular.get<FirebaseInstances>().getFirebaseAuthInstance)),
        // Bind.factory((i) => AuthenticationRepositoryImpl(
        //     authenticationDataSourceAbstract:
        //         Modular.get<AuthenticationDataSourceImpl>())),
        // Bind.factory((i) => LoginWithEmailAndPasswordUseCase(
        //     authenticationRepositoryAbstract:
        //         Modular.get<AuthenticationRepositoryImpl>())),
        Bind.singleton((i) => ProfileCubit(
              sessionManager: Modular.get<SessionManager>(),
            ))
        //     loginWithEmailAndPasswordUseCase:
        //         Modular.get<LoginWithEmailAndPasswordUseCase>()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => ProfilePage(
                  sessionManager: Modular.get<SessionManager>(),
                )),
        // ChildRoute('/authpage',
        //     child: (context, args) => BlocProvider(
        //           create: (context) => Modular.get<AuthenticationCubit>(),
        //           child: const AuthenticationPage(),
        //         ))
      ];
}
