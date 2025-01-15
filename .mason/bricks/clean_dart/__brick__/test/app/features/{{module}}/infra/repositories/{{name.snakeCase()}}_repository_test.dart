import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:clean_dart_with_bloc/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:clean_dart_with_bloc/app/features/{{module}}/infra/datasources/i_{{name.snakeCase()}}_datasource.dart';
import 'package:clean_dart_with_bloc/app/features/{{module}}/infra/repositories/{{name.snakeCase()}}_repository.dart';

import '../../../../mocks/app_failure_mock.dart';

class _DatasourceMock extends Mock implements I{{name.pascalCase()}}Datasource {}

void main() {
  final datasource = _DatasourceMock();
  final repository = {{name.pascalCase()}}Repository(datasource);
  test('{{name.sentenceCase()}} repository ...', () async {
    when(() => datasource.call(I))
        .thenAnswer((_) async => unit);
    final result = await repository.call(i);
    expect(result.fold((l) => l, (r) => r), isA<Unit>());
  });

  test('{{name.sentenceCase()}} repository failure...', () async {
    when(() => datasource.call(i))
        .thenThrow(appFailureMock);
    final result = await repository.call(i);
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
