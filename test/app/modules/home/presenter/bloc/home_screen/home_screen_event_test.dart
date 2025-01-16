import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_state.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/home_screen/home_screen_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreenEvent', () {
    test(
      'Should event be HomeScreenEvent when call ChangeAdressStateEvent constructor',
      () async {
        final tGetAddressState = GetAddressState();
        final tChangeAdressStateEvent =
            ChangeAdressStateEvent(state: tGetAddressState);
        expect(tChangeAdressStateEvent, isA<ChangeAdressStateEvent>());
        expect(tChangeAdressStateEvent.props, equals([tGetAddressState]));
      },
    );
  });
}
