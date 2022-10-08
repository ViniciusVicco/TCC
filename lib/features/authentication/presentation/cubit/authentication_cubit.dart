import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc/features/authentication/domain/usecases/login_with_email_and_password_use_case.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase;
  AuthenticationCubit({required this.loginWithEmailAndPasswordUseCase})
      : super(const AuthenticationInitial());

  late bool showPassWord;
  late bool enablePassWordField;
  late bool enableEmailField;

  void init() {}

  Future<void> login({required String email, required String password}) async {
    emit(const AuthenticationInProgressState());
    final loginResponse = await loginWithEmailAndPasswordUseCase
        .loginWithEmailAndPassword(email: email, password: password);
    await Future.delayed(const Duration(seconds: 2));
    loginResponse.fold((failure) {}, (userCredentials) {
      navigateToTrainingModule();
      //Metodo de armazenar sessão
      //Metodo de redirecionar usuário
      //Método para checar primeiro acesso.
    });
    emit(const AuthenticationInitial());
  }

  Future<void> navigateToRegistrerModule() async {
    await Modular.to.pushNamed("/registration/");
  }

  void navigateToTrainingModule() {
    Modular.to.pushNamed("/training/");
  }
}
