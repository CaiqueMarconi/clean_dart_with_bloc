import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_dart_with_bloc/app/modules/home/domain/helpers/params/get_address_param.dart';
import 'package:clean_dart_with_bloc/app/modules/home/domain/usecases/get_address_usecase/i_get_address_usecase.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_event.dart';

import 'get_address_state.dart';

// CAMADA BLOC: No Bloc, a camada Bloc é responsável por processar eventos e aplicar a lógica de negócios necessária,
// emitindo estados que representam as respostas do componente. Ela conecta eventos às transições de estado de forma reativa.

class GetAddressBloc extends Bloc<AddressEvent, GetAddressState> {
  final IGetAddressUsecase _getAddressUsecase;

  GetAddressBloc({
    required IGetAddressUsecase getAddressUsecase,
  })  : _getAddressUsecase = getAddressUsecase,
        super(InitialGetAddressState()) {
    on<GetAddressEvent>(_getAdressEvent);
  }

  Future<void> _getAdressEvent(
    GetAddressEvent event,
    Emitter<GetAddressState> emit,
  ) async {
    emit(LoadingGetAddressState());
    final result = await _getAddressUsecase.call(
      GetAddressParam(cep: event.cep),
    );
    result.fold(
      (left) => emit(ErrorGetAdressState()),
      (right) => emit(
        SuccessGetAddressState(
          address: right,
        ),
      ),
    );
  }
}
