import 'package:clean_dart_with_bloc/app/modules/home/domain/respositories/i_get_address_repository.dart';
import 'package:either_dart/either.dart';
import '../../../../core/services/failures/app_failure/i_app_failure.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/helpers/params/get_address_param.dart';
import '../datasources/i_get_address_datasource.dart';

class GetAddressRepository implements IGetAddressRepository {
  final IGetAddressDatasource _datasource;

  const GetAddressRepository(this._datasource);

  @override
  Future<Either<IAppFailure, AddressEntity>> call(
      GetAddressParam params) async {
    try {
      final response = await _datasource(params);
      return Right(response);
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }
}
