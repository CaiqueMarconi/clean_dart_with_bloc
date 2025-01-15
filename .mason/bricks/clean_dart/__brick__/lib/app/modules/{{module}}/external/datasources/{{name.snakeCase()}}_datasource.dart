
import '../../infra/datasources/i_{{name.snakeCase()}}_datasource.dart';
import '../helpers/params/{{name.snakeCase()}}_param.dart';
import '../entities/{{entities.snakeCase()}}_entity.dart';


class {{name.pascalCase()}}Datasource implements I{{name.pascalCase()}}Datasource {

  const {{name.pascalCase()}}Datasource();

  @override
  Future<{{entities.pascalCase()}}Entity> call({{name.pascalCase()}}Param params) async {
    return;
  }
}
