import 'package:tcc/core/failure/abstract_failure.dart';

class CantUploadImageFailure implements Failure {
  @override
  String get message => "Não foi possível concluir o uplaod de sua imagem";
}
