import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc/core/failure/abstract_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tcc/features/registration/data/datasources/registration_datasource_abstract.dart';
import 'package:tcc/features/registration/domain/failures/cant_create_account_email_in_use_failure.dart';
import 'package:tcc/features/registration/domain/failures/cant_create_account_failure.dart';
import 'package:tcc/features/registration/domain/repositories/registration_repository_abstract.dart';

import '../failures/cant_create_account_due_to_invalid_email_failure.dart';

class RegistrationRepositoryImpl implements RegistrationRepositoryAbstract {
  final RegistrationDataSourceAbstract registrationDataSourceAbstract;
  RegistrationRepositoryImpl({required this.registrationDataSourceAbstract});
  @override
  Future<Either<Failure, UserCredential>> createAccountWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await registrationDataSourceAbstract
          .createAccountWithEmailAndPassword(email: email, password: password);
      if (response.success) {
        return Right(response.data);
      } else {
        return Left(CantCreateAccountFailure());
      }
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "email-already-in-use":
          return Left(CantCreateAccountEmailInUseFailure());
        case "invalid-email":
          return Left(CantCreatAccountDueToInvalidEmailFailure());
        case "operation-not-allowed":
          return Left(CantCreateAccountFailure());
        case "weak-password":
          return Left(CantCreateAccountFailure());
        default:
          return Left(CantCreateAccountFailure());
      }
    } catch (error) {
      return Left(CantCreateAccountFailure());
    }
  }
}
