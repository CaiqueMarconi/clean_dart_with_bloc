import 'package:clean_dart_with_bloc/app/core/services/rest_client/i_http_service.dart';
import 'package:clean_dart_with_bloc/app/modules/home/external/mappers/address_mapper.dart';

import '../../../../core/services/rest_client/helpers/params/http_param.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/helpers/params/get_address_param.dart';
import '../../infra/datasources/i_get_address_datasource.dart';

class GetAddressDatasource implements IGetAddressDatasource {
  final IHttpService _httpService;

  GetAddressDatasource({
    required IHttpService httpService,
  }) : _httpService = httpService;

  @override
  Future<AddressEntity> call(GetAddressParam params) async {
    final url = 'https://viacep.com.br/ws/${params.cep}/json/';
    final data = await _httpService.get(HttpParam(url: url));
    final result = AddressMapper.fromMap(data.response);
    return result;
  }
}
