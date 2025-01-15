
import '../helpers/params/{{name.snakeCase()}}_param.dart';
import '../entities/{{entities.snakeCase()}}_entity.dart';

abstract class I{{name.pascalCase()}}Datasource {
  Future<{{entities.pascalCase()}}Entity> call({{name.pascalCase()}}Param params);
}
