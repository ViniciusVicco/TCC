import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/features/training/presentation/cubit/timer_cubit.dart';
import 'package:tcc/features/training/presentation/pages/timer_page.dart';

import '../presentation/pages/timer_config_page.dart';

class TrainingModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => TrainingCubit())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => BlocProvider(
                  create: (context) => Modular.get<TrainingCubit>(),
                  child: TimerPage(),
                )),
        ChildRoute('/training_config/',
            child: (context, args) => const TimerConfigPage())
      ];
  @override
  void dispose() {
    log("${this.toString()} disposed");
    super.dispose();
  }
}
