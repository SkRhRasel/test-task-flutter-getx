import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_task_flutter_getx/data/models/cryptoResponse.dart';
import 'package:test_task_flutter_getx/data/models/list_response.dart';

class APIProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.maxAuthRetries = 3;
    httpClient.timeout = const Duration(seconds: 120);
    super.onInit();
  }

  /// *** Common Server Request *** ///

  Future<ListResponse> getRequest(String url) async {
    final response = await get(url);
    GetUtils.printFunction("getRequest url ", response.request?.url, "");
    if (response.status.hasError) {
      GetUtils.printFunction("handleResponse statusText", response.statusText, "");
      return Future.error(response.statusText as String);
    } else {
      GetUtils.printFunction("handleResponse body", response.body, "");
      return ListResponse.fromJson(response.body);
    }
  }

  Future<CryptoInfo> getRequestForCryptoData(String url, {Map<String, dynamic>? query}) async {
    final response = await get(url, query: query);
    GetUtils.printFunction("getRequest url ", response.request?.url, "");
    return handleResponse(response);
  }

  Future<CryptoInfo> handleResponse(Response response) async {
    if (response.statusCode == 401) {
      final storage = GetStorage();
      storage.erase();
      Get.back();
      return Future.error(response.statusText as String);
    }
    if (response.status.hasError) {
      GetUtils.printFunction("handleResponse statusText", response.statusText, "");
      return Future.error(response.statusText as String);
    } else {
      GetUtils.printFunction("handleResponse body", response.body, "");
      // return CryptoInfo.fromJson(response.body);
      return cryptoInfoFromJson(response.body);
    }
  }
}
