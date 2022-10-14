import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/config/firebase/firebase_instances.dart';
import 'package:tcc/core/session/session_manager.dart';
import 'package:tcc/features/authentication/module/authentication_module.dart';
import 'package:tcc/features/profile/module/profile_module.dart';
import 'package:tcc/features/registration/module/registration_module.dart';
import '../../features/training/module/training_module.dart';

class AppModule extends Module {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseDatabase firebaseDatabase;
  AppModule(
      {required this.firebaseAuth,
      required this.firebaseFirestore,
      required this.firebaseDatabase});
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => FirebaseInstances(
            firebaseAuth, firebaseFirestore, firebaseDatabase)),
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
