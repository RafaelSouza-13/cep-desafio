import 'cep.dart';

class CepsCadastrados {
  List<Cep> listaCeps = [];

  CepsCadastrados(this.listaCeps);

  CepsCadastrados.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      json['results'].forEach((cep) {
        listaCeps.add(Cep.toEndPoint(cep));
      });
    }
  }
}
