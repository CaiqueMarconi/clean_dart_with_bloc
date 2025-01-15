

import 'helpers/params/http_param.dart';
import 'helpers/responses/http_response.dart';

abstract class IHttpService {
  Future<HttpResponse> get(HttpParam param);
}
