part of 'registration_cubit.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationInProgressState extends RegistrationState {}

class RegistrationSuccessState extends RegistrationState {}

class RegistrationFailureState extends RegistrationState {
  const RegistrationFailureState({required this.message});
  final String message;
}
