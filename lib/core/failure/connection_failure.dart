import 'package:tcc/core/failure/abstract_failure.dart';

class ConnectionFailure implements Failure {
  @override
  String get message => "Sua conexão pode estar intermitente ou inesistente.";
}
