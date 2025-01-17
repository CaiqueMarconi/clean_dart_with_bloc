import 'package:either_dart/either.dart';

import '../../../../../core/services/failures/app_failure/i_app_failure.dart';
import '../../entities/address_entity.dart';
import '../../helpers/params/get_address_param.dart';

abstract class IGetAddressUsecase {
  Future<Either<IAppFailure, AddressEntity>> call(GetAddressParam params);
}
