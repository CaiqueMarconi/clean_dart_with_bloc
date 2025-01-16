import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_state.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/home_screen/home_screen_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreenState', () {
    test(
      'Should state be HomeScreenState when call HomeScreenState constructor',
      () async {
        final tHomeScreenState =
            CurrentHomeScreenState(getAdressState: GetAddressState());
        expect(tHomeScreenState, isA<HomeScreenState>());
        expect(tHomeScreenState.currentState(),
            CurrentHomeScreenState(getAdressState: GetAddressState()));
      },
    );
  });
}
