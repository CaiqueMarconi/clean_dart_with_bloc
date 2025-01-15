import '../get_address/get_address_state.dart';

abstract class HomeScreenState {
  final GetAddressState getAdressState;

  HomeScreenState({required this.getAdressState});

  CurrentHomeScreenState currentState({
    GetAddressState? getAdressState,
  }) {
    return CurrentHomeScreenState(
      getAdressState: getAdressState ?? this.getAdressState,
    );
  }
}

class CurrentHomeScreenState extends HomeScreenState {
  CurrentHomeScreenState({
    required GetAddressState getAdressState,
  }) : super(getAdressState: getAdressState);
}
