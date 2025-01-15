import 'package:clean_dart_with_bloc/app/core/core_module.dart';
import 'package:clean_dart_with_bloc/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.module(Modular.initialRoute, module: HomeModule());
  }
}
