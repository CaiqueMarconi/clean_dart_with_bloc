import 'package:clean_dart_with_bloc/app/modules/home/domain/entities/address_entity.dart';
import 'package:equatable/equatable.dart';

// CAMADA STATE: No Bloc, a camada de estado define as condições imutáveis que descrevem o momento atual do Bloc.
// Cada estado reflete uma situação específica do componente, como carregamento, sucesso ou erro.
// Estados são imutáveis, e suas mudanças notificam a interface para atualizar a exibição conforme necessário.

class GetAddressState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialGetAddressState extends GetAddressState {} // estado inicial

class LoadingGetAddressState extends GetAddressState {} // estado de loading

class SuccessGetAddressState extends GetAddressState {
  // estado de sucesso
  final AddressEntity address;

  SuccessGetAddressState({required this.address});

  @override
  List<Object?> get props => [address];
}

class ErrorGetAdressState extends GetAddressState {} // estado de erro
