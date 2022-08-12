import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/custom/interface/landing_pages/landing_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const LandingPage(title: "Roi")),
      ];
}
