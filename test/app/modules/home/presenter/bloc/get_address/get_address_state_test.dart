import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../mocks/home_mocks.dart';

void main() {
  group('GetAddressStateTest', () {
    test(
        'Should state be GetAddressState when call InitialGetAddressState constructor',
        () {
      final tInitialGetAddressState = InitialGetAddressState();
      expect(tInitialGetAddressState, isA<InitialGetAddressState>());
    });
    test('Should state be GetAddressState when call constructor', () {
      final tInitialGetAddressState = GetAddressState();
      expect(tInitialGetAddressState, isA<GetAddressState>());
      expect(tInitialGetAddressState.props, equals([]));
    });

    test(
        'Should state be GetAddressState when call LoadingGetAddressState constructor',
        () {
      final tLoadingGetAddressState = LoadingGetAddressState();
      expect(tLoadingGetAddressState, isA<LoadingGetAddressState>());
    });
    test(
        'Should state be GetAddressState when call SuccessGetAddressState constructor',
        () {
      final tSuccessGetAddressState =
          SuccessGetAddressState(address: addressEntityMock);
      expect(tSuccessGetAddressState, isA<SuccessGetAddressState>());
      expect(tSuccessGetAddressState.props, equals([addressEntityMock]));
    });

    test(
        'Should state be GetAddressState when call ErrorGetAdressState constructor',
        () {
      final tErrorGetAdressState = ErrorGetAdressState();
      expect(tErrorGetAdressState, isA<ErrorGetAdressState>());
    });
  });
}
