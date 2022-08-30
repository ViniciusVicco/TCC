import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/features/authentication/module/authentication_module.dart';
import 'package:tcc/features/registration/module/registration_module.dart';
import 'package:tcc/features/timer/module/timer_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: AuthenticationModule()),
        ModuleRoute('/timer', module: TimerModule()),
        ModuleRoute('/registration', module: RegistrationModule())
      ];
}