class Cep {
  String? _objId;
  String? _cep;
  String? _logradouro;
  String? _complemento;
  String? _bairro;
  String? _cidade;
  String? _estado;

  Cep(
      {String? objId,
      String? cep,
      String? logradouro,
      String? complemento,
      String? bairro,
      String? cidade,
      String? estado}) {
    if (objId != null) {
      _objId = objId;
    }
    if (cep != null) {
      _cep = cep;
    }
    if (logradouro != null) {
      _logradouro = logradouro;
    }
    if (complemento != null) {
      _complemento = complemento;
    }
    if (bairro != null) {
      _bairro = bairro;
    }
    if (cidade != null) {
      _cidade = cidade;
    }
    if (estado != null) {
      _estado = estado;
    }
  }
  String? get objId => _objId;
  set objId(String? objId) => _cep = objId;
  String? get cep => _cep;
  set cep(String? cep) => _cep = cep;
  String? get logradouro => _logradouro;
  set logradouro(String? logradouro) => _logradouro = logradouro;
  String? get complemento => _complemento;
  set complemento(String? complemento) => _complemento = complemento;
  String? get bairro => _bairro;
  set bairro(String? bairro) => _bairro = bairro;
  String? get cidade => _cidade;
  set cidade(String? cidade) => _cidade = cidade;
  String? get estado => _estado;
  set estado(String? estado) => _estado = estado;

  Cep.fromJson(Map<String, dynamic> json) {
    _cep = limpaCep(json['cep']);
    _logradouro = json['logradouro'];
    _complemento = json['complemento'];
    _bairro = json['bairro'];
    _cidade = json['localidade'];
    _estado = json['uf'];
  }

  Cep.toEndPoint(Map<String, dynamic> json) {
    _objId = json['objectId'];
    _cep = limpaCep(json['cep']);
    _logradouro = json['logradouro'];
    _complemento = json['complemento'];
    _bairro = json['bairro'];
    _cidade = json['localidade'];
    _estado = json['uf'];
  }

  String? limpaCep(String? cep) {
    if (cep == null) {
      return null;
    } else {
      String cepFormatado = cep.replaceAll("-", "");
      return cepFormatado;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['complemento'] = _complemento;
    data['bairro'] = _bairro;
    data['localidade'] = _cidade;
    data['uf'] = _estado;
    return data;
  }
}
