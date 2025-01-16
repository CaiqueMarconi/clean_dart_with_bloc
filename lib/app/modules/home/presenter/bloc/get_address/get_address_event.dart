import 'package:equatable/equatable.dart';

abstract class AddressEvent extends Equatable {}

class GetAddressEvent extends AddressEvent {
  final String cep;

  GetAddressEvent({
    required this.cep,
  });

  @override
  List<Object?> get props => [cep];
}
