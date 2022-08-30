import 'package:tcc/features/timer/domain/entities/training.dart';

import '../../data/models/events/training_event.dart';

class ExerciseEvent implements AbstractTrainingEvent {
  Training training;
  int now;
  ExerciseEvent({required this.now, required this.training});
}
