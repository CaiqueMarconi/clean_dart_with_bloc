import 'package:equatable/equatable.dart';

import '../get_address/get_address_state.dart';

abstract class HomeScreenState extends Equatable {
  final GetAddressState getAdressState;

  const HomeScreenState({required this.getAdressState});

  CurrentHomeScreenState currentState({
    GetAddressState? getAdressState,
  }) {
    return CurrentHomeScreenState(
      getAdressState: getAdressState ?? this.getAdressState,
    );
  }

  @override
  List<Object?> get props => [getAdressState];
}

class CurrentHomeScreenState extends HomeScreenState {
  const CurrentHomeScreenState({
    required super.getAdressState,
  });
}
