import 'package:tcc/features/training/domain/entities/training.dart';

import '../../data/models/events/training_event.dart';

class ExerciseEvent implements AbstractTrainingEvent {
  Training training;
  int now;
  ExerciseEvent({required this.now, required this.training});
}
