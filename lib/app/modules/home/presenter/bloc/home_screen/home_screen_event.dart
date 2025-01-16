import 'package:equatable/equatable.dart';

import '../get_address/get_address_state.dart';

abstract class HomeScreenEvent extends Equatable {}

class ChangeAdressStateEvent extends HomeScreenEvent {
  final GetAddressState state;

  ChangeAdressStateEvent({
    required this.state,
  });

  @override
  List<Object?> get props => [state];
}
