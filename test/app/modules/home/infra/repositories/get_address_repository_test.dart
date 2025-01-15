import 'package:clean_dart_with_bloc/app/core/services/rest_client/failures/app_failure/i_app_failure.dart';
import 'package:clean_dart_with_bloc/app/modules/home/domain/entities/address_entity.dart';
import 'package:clean_dart_with_bloc/app/modules/home/infra/datasources/i_get_address_datasource.dart';
import 'package:clean_dart_with_bloc/app/modules/home/infra/repositories/get_address_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/app_failure_mock.dart';
import '../../../../../mocks/home_mocks.dart';

class _DatasourceMock extends Mock implements IGetAddressDatasource {}

void main() {
  final datasource = _DatasourceMock();
  final repository = GetAddressRepository(datasource);
  test('Get address repository ...', () async {
    when(() => datasource.call(getAddressParamMock))
        .thenAnswer((_) async => addressEntityMock);
    final result = await repository.call(getAddressParamMock);
    expect(result.fold((l) => l, (r) => r), isA<AddressEntity>());
  });

  test('Get address repository failure...', () async {
    when(() => datasource.call(getAddressParamMock)).thenThrow(appFailureMock);
    final result = await repository.call(getAddressParamMock);
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
