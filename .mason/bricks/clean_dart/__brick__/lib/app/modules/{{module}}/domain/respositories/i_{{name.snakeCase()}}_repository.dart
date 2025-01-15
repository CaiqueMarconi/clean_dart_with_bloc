


import 'package:fpdart/fpdart.dart';
import 'package:clean_dart_with_bloc/app/core/shared/failures/app_failure/i_app_failure.dart';
import '../helpers/params/{{name.snakeCase()}}_param.dart';
import '../entities/{{entities.snakeCase()}}_entity.dart';

abstract class I{{name.pascalCase()}}Repository {
  Future<Either<IAppFailure, {{entities.pascalCase()}}Entity>> call({{name.pascalCase()}}Param params);
}
