import 'package:clean_dart_with_bloc/app/core/services/rest_client/helpers/params/http_param.dart';
import 'package:clean_dart_with_bloc/app/core/services/rest_client/helpers/responses/http_response.dart';
import 'package:clean_dart_with_bloc/app/core/services/rest_client/i_http_service.dart';
import 'package:clean_dart_with_bloc/app/modules/home/domain/entities/address_entity.dart';
import 'package:clean_dart_with_bloc/app/modules/home/external/datasources/get_address_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/home_mocks.dart';

class HttpServiceMock extends Mock implements IHttpService {}

class HttpParamFake extends Fake implements HttpParam {}

void main() {
  final httpService = HttpServiceMock();
  final datasource = GetAddressDatasource(httpService: httpService);

  setUpAll(() {
    registerFallbackValue(HttpParamFake());
  });

  test('Get address datasource ...', () async {
    when(() => httpService.get(any())).thenAnswer(
      (invocation) async => HttpResponse(response: {
        "cep": "",
        "logradouro": "",
        "complemento": "",
        "unidade": "",
        "bairro": "",
        "localidade": "",
        "uf": "",
        "estado": "",
        "regiao": "",
        "ibge": "",
        "gia": "",
        "ddd": "",
        "siafi": ""
      }),
    );
    final result = await datasource.call(getAddressParamMock);
    expect(result, isA<AddressEntity>());
  });
}
