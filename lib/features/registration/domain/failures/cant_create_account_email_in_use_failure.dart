import 'package:tcc/core/failure/abstract_failure.dart';

class CantCreateAccountEmailInUseFailure implements Failure {
  @override
  String get message => "Este e-mail já está sendo utilizado";
}
