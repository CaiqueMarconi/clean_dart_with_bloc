import 'package:clean_dart_with_bloc/app/modules/home/domain/entities/address_entity.dart';
import 'package:clean_dart_with_bloc/app/modules/home/domain/helpers/params/get_address_param.dart';

final AddressEntity addressEntityMock = AddressEntity(
  postalCode: '',
  street: '',
  complement: '',
  unit: '',
  neighborhood: '',
  city: '',
  stateAbbreviation: '',
  state: '',
  region: '',
  ibgeCode: '',
  giaCode: '',
  areaCode: '',
  siafiCode: '',
);

final GetAddressParam getAddressParamMock = GetAddressParam(cep: '00000000');
