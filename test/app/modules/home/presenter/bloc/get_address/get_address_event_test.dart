import 'package:clean_dart_with_bloc/app/modules/home/presenter/bloc/get_address/get_address_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddressEventTest', () {
    const cep = '00000000';
    test('Should event be AddressEvent when call GetAddressEvent constructor',
        () async {
      final tGetAddressEvent = GetAddressEvent(cep: cep);

      expect(tGetAddressEvent, isA<GetAddressEvent>());
      expect(tGetAddressEvent, GetAddressEvent(cep: cep));
    });
  });
}
