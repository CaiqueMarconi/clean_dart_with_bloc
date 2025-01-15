import 'package:clean_dart_with_bloc/app/core/core_module.dart';
import 'package:clean_dart_with_bloc/app/modules/home/domain/usecases/get_address_usecase/i_get_address_usecase.dart';
import 'package:clean_dart_with_bloc/app/modules/home/external/datasources/get_address_datasource.dart';
import 'package:clean_dart_with_bloc/app/modules/home/infra/repositories/get_address_repository.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_bloc.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/home_screen/home_screen_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/respositories/i_get_address_repository.dart';
import 'domain/usecases/get_address_usecase/get_address_usecase.dart';
import 'infra/datasources/i_get_address_datasource.dart';
import 'presenter/screens/home_screen.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton(HomeScreenBloc.new);

    i.addLazySingleton(GetAddressBloc.new);

    // GET ADRESS
    i.addLazySingleton<IGetAddressUsecase>(GetAddressUsecase.new);
    i.addLazySingleton<IGetAddressRepository>(GetAddressRepository.new);
    i.addLazySingleton<IGetAddressDatasource>(GetAddressDatasource.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      Modular.initialRoute,
      child: (_) => HomeScreen(
        homeScreenBloc: Modular.get<HomeScreenBloc>(),
      ),
    );
  }
}
