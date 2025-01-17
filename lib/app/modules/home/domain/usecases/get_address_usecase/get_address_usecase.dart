import 'package:either_dart/either.dart';

import '../../../../../core/services/failures/app_failure/i_app_failure.dart';
import '../../entities/address_entity.dart';
import '../../helpers/params/get_address_param.dart';
import '../../respositories/i_get_address_repository.dart';
import 'i_get_address_usecase.dart';

class GetAddressUsecase implements IGetAddressUsecase {
  final IGetAddressRepository _repository;

  const GetAddressUsecase(this._repository);

  @override
  Future<Either<IAppFailure, AddressEntity>> call(
    GetAddressParam params,
  ) async {
    return await _repository(params);
  }
}
