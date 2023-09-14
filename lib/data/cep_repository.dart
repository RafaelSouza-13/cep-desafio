import 'package:api_desafio/data/custom_dio_cep.dart';
import 'package:api_desafio/model/cep.dart';

class CepRepository {
  final _customDio = CustomDioCep();

  Future<Cep> procurar(String cep) async {
    var response = await _customDio.dio.get("/$cep/json/");
    if (response.statusCode == 200) {
      return Cep.fromJson(response.data);
    } else {
      return Cep();
    }
  }
}
