import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/features/registration/presentation/pages/register_page.dart';

class RegistrationModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const RegisterPage()),
      ];
}
