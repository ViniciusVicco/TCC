import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/features/timer/presentation/cubit/timer_cubit.dart';
import 'package:tcc/features/timer/presentation/pages/timer_config_page.dart';
import 'package:tcc/features/timer/presentation/pages/timer_page.dart';

class TimerModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => TimerCubit())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const TimerPage()),
        ChildRoute('/timer_config/',
            child: (context, args) => const TimerConfigPage())
      ];
  @override
  void dispose() {
    print("Timer Encerrado");
    super.dispose();
  }
}
