import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:clean_dart_with_bloc/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:clean_dart_with_bloc/app/features/{{module}}/domain/respositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:clean_dart_with_bloc/app/features/{{module}}/domain/usecases/{{name.snakeCase()}}_usecase/{{name.snakeCase()}}_usecase.dart';

import '../../../../../mocks/app_failure_mock.dart';

class Repository extends Mock implements I{{name.pascalCase()}}Repository {}

void main() {
  final repository = Repository();
  final usecase = {{name.pascalCase()}}Usecase(repository);
  test('{{name.sentenceCase()}} usecase ...', () async {
    when(() => repository.call(any()))
        .thenAnswer((invocation) async => const Right(unit));
    final result = await usecase.call(any());
    expect(result.fold((l) => l, (r) => r), isA<Unit>());
  });

  test('{{name.sentenceCase()}} failure...', () async {
    when(() => repository.call(any()))
        .thenAnswer((invocation) async => Left(appFailureMock));
    final result = await usecase.call(any());
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
