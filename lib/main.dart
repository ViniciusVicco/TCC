import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/config/hive/hive_config.dart';
import 'package:tcc/custom/interface/material_app.dart';
import 'package:tcc/custom/module/main_module.dart';

import 'config/firebase/firebase_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseConfig().initFirebase();
  HiveConfig().initHive();
  FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  return runApp(ModularApp(
      module: AppModule(
          firebaseAuth: firebaseAuthInstance,
          firebaseFirestore: firebaseFirestore,
          firebaseStorage: firebaseStorage),
      child: const MainWidget()));
}
