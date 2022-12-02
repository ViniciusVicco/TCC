import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/core/session/user_auth_entity.dart';
import 'package:tcc/features/authentication/domain/usecases/login_with_email_and_password_use_case.dart';

import '../../../../core/session/session_manager.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final SessionManager sessionManager;
  final LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase;
  AuthenticationCubit(
      {required this.sessionManager,
      required this.loginWithEmailAndPasswordUseCase})
      : super(const AuthenticationInitial());

  late bool showPassWord;
  late bool enablePassWordField;
  late bool enableEmailField;

  Future<void> init() async {
    emit(const AuthenticationInProgressState(
        customMessage: "Buscando dados locais..."));
    final user = await sessionManager.getUserSession();
    if (user != null) {
      navigateToTrainingModule();
    }
    emit(const AuthenticationInitial());
  }

  Future<void> login(BuildContext context,
      {required String email, required String password}) async {
    emit(const AuthenticationInProgressState());
    final loginResponse = await loginWithEmailAndPasswordUseCase.login(
        email: email, password: password);
    await Future.delayed(const Duration(seconds: 2));
    await loginResponse.fold((failure) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(failure.message)));
    }, (userCredentials) async {
      User? user = userCredentials.user;
      if (user != null) {
        await buildUserSession(user);
        navigateToTrainingModule();
      }
    });
    emit(const AuthenticationInitial());
  }

  Future<void> buildUserSession(User user) async {
    await sessionManager.storeUserSession(UserAuthEntity(
        uid: user.uid,
        userEmail: user.email!,
        phone: user.phoneNumber ?? "",
        userName: user.displayName ?? ""));
    final data = await sessionManager.getUserSession();
  }

  Future<void> navigateToRegistrerModule() async {
    await Modular.to.pushNamed("/registration/");
  }

  void navigateToTrainingModule() {
    Modular.to.pushNamed("/training/");
  }
}
