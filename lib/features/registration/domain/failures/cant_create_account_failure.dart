import 'package:tcc/core/failure/abstract_failure.dart';

class CantCreateAccountFailure implements Failure {
  @override
  String get message => "Ocorreu um problema ao criar sua conta";
}
