import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc/core/failure/abstract_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tcc/features/registration/data/datasources/registration_datasource_abstract.dart';
import 'package:tcc/features/registration/domain/repositories/cant_sign_in_failure.dart';
import 'package:tcc/features/registration/domain/repositories/registration_repository_abstract.dart';

class RegisterRepositoryImpl implements RegisterRepositoryAbstract {
  final RegistrationDataSourceAbstract registrationDataSourceAbstract;
  RegisterRepositoryImpl({required this.registrationDataSourceAbstract});
  @override
  Future<Either<Failure, AuthCredential>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await registrationDataSourceAbstract
          .createUserWithEmailAndPassword(email: email, password: password);
      if (response.success) {
        return Right(response.data);
      } else {
        return Left(CantSignInFailure());
      }
    } catch (error) {
      return Left(CantSignInFailure());
    }
  }
}
