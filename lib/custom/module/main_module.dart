import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/config/firebase/firebase_instances.dart';
import 'package:tcc/core/session/session_manager.dart';
import 'package:tcc/features/authentication/module/authentication_module.dart';
import 'package:tcc/features/profile/module/profile_module.dart';
import 'package:tcc/features/registration/module/registration_module.dart';
import '../../features/training/module/training_module.dart';

class AppModule extends Module {
  final FirebaseAuth firebaseAuth;
  AppModule({required this.firebaseAuth});
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => FirebaseInstances(firebaseAuth)),
        Bind.singleton((i) => SessionManager())
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: AuthenticationModule()),
        ModuleRoute('/training', module: TrainingModule()),
        ModuleRoute(
          '/registration/',
          module: RegistrationModule(),
        ),
        ModuleRoute(
          '/profile/',
          module: ProfileModule(),
        ),
      ];
}
