import 'package:clean_dart_with_bloc/app/core/services/rest_client/failures/app_failure/i_app_failure.dart';
import 'package:clean_dart_with_bloc/app/modules/home/domain/entities/address_entity.dart';
import 'package:clean_dart_with_bloc/app/modules/home/domain/respositories/i_get_address_repository.dart';
import 'package:clean_dart_with_bloc/app/modules/home/domain/usecases/get_address_usecase/get_address_usecase.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/app_failure_mock.dart';
import '../../../../../mocks/home_mocks.dart';

class Repository extends Mock implements IGetAddressRepository {}

void main() {
  final repository = Repository();
  final usecase = GetAddressUsecase(repository);
  test('Get address usecase ...', () async {
    when(() => repository.call(getAddressParamMock))
        .thenAnswer((invocation) async => Right(addressEntityMock));
    final result = await usecase.call(getAddressParamMock);
    expect(result.fold((l) => l, (r) => r), isA<AddressEntity>());
  });

  test('Get address failure...', () async {
    when(() => repository.call(getAddressParamMock))
        .thenAnswer((invocation) async => Left(appFailureMock));
    final result = await usecase.call(getAddressParamMock);
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
