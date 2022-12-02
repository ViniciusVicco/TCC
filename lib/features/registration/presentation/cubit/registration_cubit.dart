import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tcc/features/registration/domain/usecases/registration_use_case.dart';

import '../../../../core/session/session_manager.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final SessionManager sessionManager;
  final RegistrationUseCase registrationUseCase;
  RegistrationCubit(
      {required this.sessionManager, required this.registrationUseCase})
      : super(RegistrationInitial());

  Future<void> accountRegistration(BuildContext context,
      {required String email, required String password}) async {
    emit(RegistrationInProgressState());
    final response =
        await registrationUseCase.register(email: email, password: password);
    response.fold((failure) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(failure.message)));
      emit(RegistrationInitial());
    }, (credential) {
      emit(RegistrationSuccessState());
    });
  }

  bool checkIfPassWordsAreEqual(
      {required String passWord, required String confirmPassword}) {
    return passWord == confirmPassword;
  }
}
