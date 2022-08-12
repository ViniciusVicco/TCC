import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/custom/interface/material_app.dart';
import 'package:tcc/custom/module/main_module.dart';

Future<void> main() async {
  return runApp(ModularApp(module: AppModule(), child: const MainWidget()));
}
