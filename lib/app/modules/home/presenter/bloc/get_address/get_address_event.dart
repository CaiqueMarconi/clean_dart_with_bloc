abstract class GetAddressEvent {}

class GetAddress extends GetAddressEvent {
  final String cep;

  GetAddress({
    required this.cep,
  });
}
