import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/config/firebase/firebase_instances.dart';
import 'package:tcc/core/session/session_manager.dart';
import 'package:tcc/features/registration/data/datasources/registration_datasource_impl.dart';
import 'package:tcc/features/registration/domain/repositories/registration_repository_impl.dart';
import 'package:tcc/features/registration/domain/usecases/registration_use_case.dart';
import 'package:tcc/features/registration/presentation/cubit/registration_cubit.dart';
import 'package:tcc/features/registration/presentation/pages/registration_page.dart';

class RegistrationModule extends Module {
  RegistrationModule();

  @override
  List<Bind> get binds => [
        Bind.factory((i) => RegistrationDataSourceImpl(
            firebaseAuth:
                Modular.get<FirebaseInstances>().getFirebaseAuthInstance)),
        Bind.factory((i) => RegistrationRepositoryImpl(
            registrationDataSourceAbstract:
                Modular.get<RegistrationDataSourceImpl>())),
        Bind.factory((i) => RegistrationUseCase(
            repository: Modular.get<RegistrationRepositoryImpl>())),
        Bind.singleton((i) => RegistrationCubit(
            sessionManager: Modular.get<SessionManager>(),
            registrationUseCase: Modular.get<RegistrationUseCase>()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => BlocProvider(
                  create: (context) => Modular.get<RegistrationCubit>(),
                  child: const RegisterPage(),
                )),
      ];
}
