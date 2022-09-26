import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/custom/interface/material_app.dart';
import 'package:tcc/custom/module/main_module.dart';

import 'config/firebase_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseConfig().initFirebase();
  FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;

  return runApp(ModularApp(
      module: AppModule(firebaseAuth: firebaseAuthInstance),
      child: const MainWidget()));
}
