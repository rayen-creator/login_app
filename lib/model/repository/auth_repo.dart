import 'package:mvvm_app/model/apis/app_url.dart';
import 'package:mvvm_app/model/services/networkApiService.dart';

class AuthRepository {
  final _service = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _service.postResponse(AppUrl.loginEndPint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registre(dynamic data) async {
    try {
      dynamic response = await _service.postResponse(AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
