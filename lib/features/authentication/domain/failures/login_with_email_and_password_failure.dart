import 'package:tcc/core/failure/abstract_failure.dart';

class LoginWithEmailAndPasswordFailure implements Failure {
  @override
  String get message => "Ocorreu um erro ao tentar autenticar";
}
