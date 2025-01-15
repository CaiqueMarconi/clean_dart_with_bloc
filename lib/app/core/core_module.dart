import 'package:clean_dart_with_bloc/app/core/services/rest_client/i_http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'services/rest_client/http_service.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);
    i.addLazySingleton((i) => Dio());
    i.add<IHttpService>(HttpService.new);
  }
}
