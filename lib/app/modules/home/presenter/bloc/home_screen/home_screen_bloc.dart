import 'package:bloc/bloc.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_bloc.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/home_screen/home_screen_event.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/home_screen/home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final GetAddressBloc getAddressBloc;

  HomeScreenBloc({required this.getAddressBloc})
      : super(CurrentHomeScreenState(getAdressState: getAddressBloc.state)) {
    on<ChangeAdressStateEvent>(_changeAdressStateEvent);
  }

  Future<void> _changeAdressStateEvent(
    ChangeAdressStateEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    emit(
      CurrentHomeScreenState(
        getAdressState: event.state,
      ),
    );
  }
}
