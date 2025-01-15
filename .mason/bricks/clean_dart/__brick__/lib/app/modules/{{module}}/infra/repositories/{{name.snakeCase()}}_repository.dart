import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/failures/i_app_failure.dart';
import '../../domain/repositories/i_{{name.snakeCase()}}_repository.dart';
import '../datasources/i_{{name.snakeCase()}}_datasource.dart';
import '../helpers/params/{{name.snakeCase()}}_param.dart';
import '../entities/{{entities.snakeCase()}}_entity.dart';

class {{name.pascalCase()}}Repository implements I{{name.pascalCase()}}Repository {
  final I{{name.pascalCase()}}Datasource _datasource;

  const {{name.pascalCase()}}Repository(this._datasource);

  @override
  Future<Either<IAppFailure, {{entities.pascalCase()}}Entity>> call({{name.pascalCase()}}Param params) async {
    try {
      final response = await _datasource(params);

      return Right(response);
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }
}
