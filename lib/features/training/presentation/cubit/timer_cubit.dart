import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tcc/core/session/session_manager.dart';

import '../../data/models/events/end_event.dart';
import '../../data/models/events/start_event.dart';
import '../../data/models/events/training_event.dart';
import '../../domain/entities/training_event.dart';
import '../../domain/entities/training.dart';

part 'timer_state.dart';

class TrainingCubit extends Cubit<TrainingState> {
  final SessionManager sessionManager;
  List<Training> trainingTimers = [];
  TrainingCubit({required this.sessionManager}) : super(TrainingInitialState());

  bool isCounting = false;

  void init() {
    trainingTimers = [
      Training(name: "Aerobico", seconds: 8),
      Training(name: "Abdominal", seconds: 5),
      Training(name: "Prancha", seconds: 7),
    ];
  }

  Stream<AbstractTrainingEvent> start() async* {
    yield StartEvent();
    for (Training training in trainingTimers) {
      for (int seconds = training.seconds; seconds >= 0; seconds--) {
        print(" seconds: $seconds, Training: ${training.name}");
        await Future.delayed(Duration(seconds: 1));
        yield (ExerciseEvent(training: training, now: seconds));
      }
    }
    isCounting = false;
    yield EndEvent();
    stopTimerCounting();
  }

  void initTimerCounting() {
    emit(TrainingCountingState());
  }

  void stopTimerCounting() {
    emit(TrainingFinishedState());
  }
}
