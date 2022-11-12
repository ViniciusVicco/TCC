import 'package:tcc/core/failure/abstract_failure.dart';

class CantLoginWithEmailAndPasswordFailure implements Failure {
  @override
  String get message => "Ocorreu um erro ao tentar autenticar";
}
