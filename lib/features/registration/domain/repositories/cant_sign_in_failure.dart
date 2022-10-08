import 'package:tcc/core/failure/abstract_failure.dart';

class CantSignInFailure implements Failure {
  @override
  String get message => "Não foi possível prosseguir com sua autenticação";
}
