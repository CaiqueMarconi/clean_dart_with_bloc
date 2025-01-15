import 'package:clean_dart_with_bloc/app/modules/home/domain/entities/address_entity.dart';

import '../../domain/helpers/params/get_address_param.dart';

abstract class IGetAddressDatasource {
  Future<AddressEntity> call(GetAddressParam params);
}
