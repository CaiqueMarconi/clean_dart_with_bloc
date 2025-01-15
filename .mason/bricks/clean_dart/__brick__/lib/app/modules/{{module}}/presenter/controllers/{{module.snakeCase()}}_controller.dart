import '../stores/{{module.snakeCase()}}store.dart';


class {{module.pascalCase()}}Controller{
  final {{module.pascalCase()}}Store _{{module.camelCase()}}Store;

  {{module.pascalCase()}}Controller({required {{module.pascalCase()}}Store {{module.camelCase()}}Store}) :
   _{{module.camelCase()}}Store = {{module.camelCase()}}Store;
}