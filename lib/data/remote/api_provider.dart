import 'package:get/get.dart';
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
      GetUtils.printFunction(
          "handleResponse statusText", response.statusText, "");
      return Future.error(response.statusText as String);
    } else {
      GetUtils.printFunction("handleResponse body", response.body, "");
      return ListResponse.fromJson(response.body);
    }
  }

  Future<CryptoInfo> getRequestForCryptoData(String url) async {
    final response = await get(url);
    GetUtils.printFunction("getRequest url ", response.request?.url, "");
    if (response.status.hasError) {
      GetUtils.printFunction(
          "handleResponse statusText", response.statusText, "");
      return Future.error(response.statusText as String);
    } else {
      GetUtils.printFunction("handleResponse body", response.body, "");
      return CryptoInfo.fromJson(response.body);
    }
  }


}
