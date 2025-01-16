import 'package:bloc_test/bloc_test.dart';
import 'package:clean_dart_with_bloc/app/modules/home/domain/helpers/params/get_address_param.dart';
import 'package:clean_dart_with_bloc/app/modules/home/domain/usecases/get_address_usecase/get_address_usecase.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_bloc.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_event.dart';
import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../mocks/app_failure_mock.dart';
import '../../../../../../mocks/home_mocks.dart';

class GetAddressUsecaseMock extends Mock implements GetAddressUsecase {}

class GetAddressParamFake extends Fake implements GetAddressParam {}

void main() {
  late GetAddressUsecaseMock getAddressUsecaseMock;

  setUpAll(() {
    getAddressUsecaseMock = GetAddressUsecaseMock();
    registerFallbackValue(GetAddressParamFake());
  });

  group('GetAddressBloc', () {
    final cep = getAddressParamMock.cep;
    blocTest(
      'Should issue [LoadingGetAddress] [SuccessGetAddress]when the usecase returns right',
      setUp: () {
        when(() => getAddressUsecaseMock.call(any()))
            .thenAnswer((invocation) async {
          return const Right(addressEntityMock);
        });
      },
      build: () => GetAddressBloc(getAddressUsecase: getAddressUsecaseMock),
      act: (bloc) => bloc.add(GetAddressEvent(cep: cep)),
      expect: () => [
        LoadingGetAddressState(),
        SuccessGetAddressState(address: addressEntityMock),
      ],
    );

    blocTest(
      'Should issue [LoadingGetAddress] [SuccessGetAddress]when the usecase returns left',
      setUp: () {
        when(() => getAddressUsecaseMock.call(any()))
            .thenAnswer((invocation) async {
          return Left(appFailureMock);
        });
      },
      build: () => GetAddressBloc(getAddressUsecase: getAddressUsecaseMock),
      act: (bloc) => bloc.add(GetAddressEvent(cep: cep)),
      expect: () => [
        LoadingGetAddressState(),
        ErrorGetAdressState(),
      ],
    );
  });
}
