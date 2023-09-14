import 'package:api_desafio/model/cep_exeption.dart';
import 'package:api_desafio/model/ceps_cadastrados.dart';
import 'package:dio/dio.dart';

import '../model/cep.dart';
import 'custom_dio_back4app.dart';

class CepBack4AppRepository {
  final CustomDioBack4App _customDio = CustomDioBack4App();

  Future<CepsCadastrados> obterCeps() async {
    var response = await _customDio.dio.get("/Cep");
    if (response.statusCode == 200) {
      return CepsCadastrados.fromJson(response.data);
    } else {
      return CepsCadastrados([]);
    }
  }

  Future<void> salvar(Cep cep) async {
    try {
      var response = await _customDio.dio.post("/Cep", data: cep.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletar(String objId) async {
    try {
      await _customDio.dio.delete("/Cep/$objId");
    } catch (e) {
      throw e;
    }
  }

  Future<bool> procurar(String cep) async {
    CepsCadastrados ceps = await obterCeps();
    if (ceps.listaCeps.isEmpty) {
      return false;
    }

    for (int i = 0; i < ceps.listaCeps.length; i++) {
      if (ceps.listaCeps[i].cep == cep) {
        return true;
      }
    }
    return false;
  }
}
