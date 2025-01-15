import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_dart_with_bloc/app/modules/home/domain/helpers/params/get_address_param.dart';
import 'package:clean_dart_with_bloc/app/modules/home/domain/usecases/get_address_usecase/i_get_address_usecase.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_event.dart';

import 'get_address_state.dart';

class GetAddressBloc extends Bloc<GetAddressEvent, GetAddressState> {
  final IGetAddressUsecase _getAddressUsecase;

  GetAddressBloc({
    required IGetAddressUsecase getAddressUsecase,
  })  : _getAddressUsecase = getAddressUsecase,
        super(InitialGetAddressState()) {
    on<GetAddress>(_getAdressEvent);
  }

  Future<void> _getAdressEvent(
    GetAddress event,
    Emitter<GetAddressState> emit,
  ) async {
    emit(LoadingGetAddressState());
    final result = await _getAddressUsecase.call(
      GetAddressParam(cep: event.cep),
    );
    result.fold(
      (left) => emit(ErrorGetAdressState(left.message)),
      (right) => emit(
        SuccessGetAddressState(
          address: right,
        ),
      ),
    );
  }
}
