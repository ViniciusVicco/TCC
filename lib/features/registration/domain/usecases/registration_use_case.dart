import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc/core/failure/abstract_failure.dart';
import 'package:tcc/core/usecase/use_case.dart';

import '../repositories/registration_repository_abstract.dart';

class RegistrationUseCase extends UseCase{
  final RegistrationRepositoryAbstract repository;
RegistrationUseCase({required this.repository});

  Future<Either<Failure, AuthCredential>>register( {required String email, required String password}) async{
    return repository.createAccountWithEmailAndPassword(email: email, password: password);
  }

  
}