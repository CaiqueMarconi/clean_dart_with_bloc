import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String postalCode;
  final String street;
  final String complement;
  final String unit;
  final String neighborhood;
  final String city;
  final String stateAbbreviation;
  final String state;
  final String region;
  final String ibgeCode;
  final String giaCode;
  final String areaCode;
  final String siafiCode;

  const AddressEntity({
    required this.postalCode,
    required this.street,
    required this.complement,
    required this.unit,
    required this.neighborhood,
    required this.city,
    required this.stateAbbreviation,
    required this.state,
    required this.region,
    required this.ibgeCode,
    required this.giaCode,
    required this.areaCode,
    required this.siafiCode,
  });

  @override
  List<Object?> get props => [
        postalCode,
        street,
        complement,
        unit,
        neighborhood,
        city,
        stateAbbreviation,
        state,
        region,
        ibgeCode,
        giaCode,
        areaCode,
        siafiCode,
      ];
}
