import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tcc/features/timer/data/models/events/end_event.dart';
import 'package:tcc/features/timer/data/models/events/start_event.dart';
import 'package:tcc/features/timer/data/models/events/training_event.dart';
import 'package:tcc/features/timer/domain/entities/training.dart';

import '../../domain/entities/exercicio_event.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  List<Training> trainingTimers = [];
  TimerCubit() : super(TimerInitial());

  void init() {
    print("Timer Cubit Iniciado");
  }

  Stream<AbstractTrainingEvent> start() async* {
    yield StartEvent();
    for (Training training in trainingTimers) {
      for (int seconds = training.seconds; seconds >= 0; seconds--) {
        await Future.delayed(Duration(seconds: 1));
        yield (ExerciseEvent(training: training, now: seconds));
      }
    }
    yield EndEvent();
  }
}
