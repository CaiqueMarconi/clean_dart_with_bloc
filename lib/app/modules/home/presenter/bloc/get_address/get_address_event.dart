import 'package:equatable/equatable.dart';

// CAMADA EVENT: no Bloc, a camada de eventos define as ações ou intenções que devem ser processadas pelo Bloc.
// Os eventos representam interações ou mudanças que o Bloc deve tratar, como requisições do usuário ou mudanças no sistema.
// A lógica para processar esses eventos e alterar o estado está definida no Bloc, e não nos eventos.

abstract class AddressEvent extends Equatable {}

class GetAddressEvent extends AddressEvent {
  final String cep;

  GetAddressEvent({
    required this.cep,
  });

  @override
  List<Object?> get props => [cep];
}
