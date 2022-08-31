part of 'timer_cubit.dart';

abstract class TrainingState extends Equatable {
  const TrainingState();

  @override
  List<Object> get props => [];
}

class TrainingInitialState extends TrainingState {}

class TrainingCountingState extends TrainingState {}

class TrainingFinishedState extends TrainingState {}
