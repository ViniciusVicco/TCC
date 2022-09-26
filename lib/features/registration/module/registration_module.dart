import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/features/registration/presentation/cubit/registration_cubit.dart';
import 'package:tcc/features/registration/presentation/pages/register_page.dart';

class RegistrationModule extends Module {
  final FirebaseAuth firebaseAuth;
  RegistrationModule({required this.firebaseAuth});

  @override
  List<Bind> get binds => [Bind.singleton((i) => RegistrationCubit())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => BlocProvider(
                  create: (context) => Modular.get<RegistrationCubit>(),
                  child: const RegisterPage(),
                )),
      ];
}
