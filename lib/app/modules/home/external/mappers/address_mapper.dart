import '../../domain/entities/address_entity.dart';

class AddressMapper {
  static AddressEntity fromMap(Map<String, dynamic> map) {
    return AddressEntity(
      postalCode: map['cep'],
      street: map['logradouro'],
      complement: map['complemento'],
      unit: map['unidade'],
      neighborhood: map['bairro'],
      city: map['localidade'],
      stateAbbreviation: map['uf'],
      state: map['estado'],
      region: map['regiao'],
      ibgeCode: map['ibge'],
      giaCode: map['gia'],
      areaCode: map['ddd'],
      siafiCode: map['siafi'],
    );
  }
}
