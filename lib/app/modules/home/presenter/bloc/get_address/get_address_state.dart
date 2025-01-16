import 'package:clean_dart_with_bloc/app/modules/home/domain/entities/address_entity.dart';
import 'package:equatable/equatable.dart';

class GetAddressState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialGetAddressState extends GetAddressState {}

class LoadingGetAddressState extends GetAddressState {}

class SuccessGetAddressState extends GetAddressState {
  final AddressEntity address;

  SuccessGetAddressState({required this.address});

  @override
  List<Object?> get props => [address];
}

class ErrorGetAdressState extends GetAddressState {}
