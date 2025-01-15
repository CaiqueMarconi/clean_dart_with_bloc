import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:clean_dart_with_bloc/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:clean_dart_with_bloc/app/features/home/infra/datasources/i_get_address_datasource.dart';
import 'package:clean_dart_with_bloc/app/features/home/infra/repositories/get_address_repository.dart';

import '../../../../mocks/app_failure_mock.dart';

class _DatasourceMock extends Mock implements IGetAddressDatasource {}

void main() {
  final datasource = _DatasourceMock();
  final repository = GetAddressRepository(datasource);
  test('Get address repository ...', () async {
    when(() => datasource.call(I))
        .thenAnswer((_) async => unit);
    final result = await repository.call(i);
    expect(result.fold((l) => l, (r) => r), isA<Unit>());
  });

  test('Get address repository failure...', () async {
    when(() => datasource.call(i))
        .thenThrow(appFailureMock);
    final result = await repository.call(i);
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
