import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:clean_dart_with_bloc/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:clean_dart_with_bloc/app/features/home/domain/respositories/i_get_address_repository.dart';
import 'package:clean_dart_with_bloc/app/features/home/domain/usecases/get_address_usecase/get_address_usecase.dart';

import '../../../../../mocks/app_failure_mock.dart';

class Repository extends Mock implements IGetAddressRepository {}

void main() {
  final repository = Repository();
  final usecase = GetAddressUsecase(repository);
  test('Get address usecase ...', () async {
    when(() => repository.call(any()))
        .thenAnswer((invocation) async => const Right(unit));
    final result = await usecase.call(any());
    expect(result.fold((l) => l, (r) => r), isA<Unit>());
  });

  test('Get address failure...', () async {
    when(() => repository.call(any()))
        .thenAnswer((invocation) async => Left(appFailureMock));
    final result = await usecase.call(any());
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
