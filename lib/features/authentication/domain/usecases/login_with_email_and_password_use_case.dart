import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc/core/usecase/use_case.dart';
import 'package:tcc/features/authentication/domain/repositories/authentication_repository_abstract.dart';

import '../../../../core/failure/abstract_failure.dart';

class LoginWithEmailAndPasswordUseCase implements UseCase {
  final AuthenTicationRepositoryAbstract authenticationRepositoryAbstract;
  LoginWithEmailAndPasswordUseCase(
      {required this.authenticationRepositoryAbstract});

  Future<Either<Failure, UserCredential>> login(
      {required String email, required String password}) {
    return authenticationRepositoryAbstract.loginWithEmailAndPassword(
        email: email, password: password);
  }
}
