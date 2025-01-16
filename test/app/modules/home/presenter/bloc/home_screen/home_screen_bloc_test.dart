import 'package:bloc_test/bloc_test.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_bloc.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_state.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/home_screen/home_screen_bloc.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/home_screen/home_screen_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetAddressBlocMock extends Mock implements GetAddressBloc {}

void main() {
  late GetAddressBlocMock getAddressBlocMock;

  setUp(() {
    getAddressBlocMock = GetAddressBlocMock();
  });

  group('HomeScreenBloc', () {
    blocTest(
      'Should change state when GetAddressBloc emit new state',
      setUp: () {
        when(() => getAddressBlocMock.state).thenReturn(GetAddressState());
      },
      build: () => HomeScreenBloc(getAddressBloc: getAddressBlocMock),
      act: (bloc) => bloc.add(
        ChangeAdressStateEvent(state: GetAddressState()),
      ),
    );
  });
}
