import 'package:clean_dart_with_bloc/app/modules/home/domain/entities/address_entity.dart';

class GetAddressState {}

class InitialGetAddressState extends GetAddressState {}

class LoadingGetAddressState extends GetAddressState {}

class SuccessGetAddressState extends GetAddressState {
  final AddressEntity address;

  SuccessGetAddressState({required this.address});
}

class ErrorGetAdressState extends GetAddressState {
  final String message;

  ErrorGetAdressState(this.message);
}
