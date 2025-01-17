import 'dart:io';
import '../failures/app_failure/app_failure.dart';
import 'helpers/params/http_param.dart';
import 'helpers/responses/http_response.dart';
import 'i_http_service.dart';
import 'package:dio/dio.dart';

class HttpService implements IHttpService {
  final Dio dio = Dio();

  // Método para fazer uma requisição GET
  @override
  Future<HttpResponse> get(HttpParam param) async {
    try {
      final response = await dio.get(
        param.url,
        queryParameters: param.body,
        options: Options(
          headers: param.headers,
        ),
      );

      return HttpResponse(response: response.data);
    } on SocketException catch (e) {
      throw AppFailure(
        message: e.toString(),
      );
    } on TypeError catch (e) {
      throw AppFailure(
        message: e.toString(),
      );
    } on DioException catch (e) {
      throw AppFailure(
        message: e.error.toString(),
      );
    }
  }
}
