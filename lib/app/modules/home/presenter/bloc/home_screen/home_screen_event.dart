import '../get_address/get_address_state.dart';

abstract class HomeScreenEvent {}

class ChangeAdressStateEvent extends HomeScreenEvent {
  final GetAddressState state;

  ChangeAdressStateEvent({
    required this.state,
  });
}
