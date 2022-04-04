import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_task_flutter_getx/data/models/list_response.dart';
import 'package:test_task_flutter_getx/root/root_screen.dart';
import '../local/constants.dart';

class APIProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.baseUrl = APIConstants.baseUrl;
    httpClient.maxAuthRetries = 3;
    httpClient.timeout = const Duration(seconds: 120);
    super.onInit();
  }

  /// *** Common Server Request *** ///

  Future<ListResponse> getRequest(String url ) async {
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

  // Future<List<dynamic>> getImageList() async {
  //   final response = await get(APIConstants.baseUrl);
  //   if (response.status.hasError){
  //     return Future.error(response.statusText!);
  //   }else{
  //     return response.body[APIConstants.products];
  //   }
  // }


  // Future<ServerResponse> handleResponse(Response response) async {
  //   if (response.statusCode == 401) {
  //     final storage = GetStorage();
  //     storage.erase();
  //     Get.back();
  //     Get.off(const RootScreen());
  //     return Future.error(response.statusText as String);
  //   }
  //
  //   if (response.status.hasError) {
  //     GetUtils.printFunction(
  //         "handleResponse statusText", response.statusText, "");
  //     return Future.error(response.statusText as String);
  //   } else {
  //     GetUtils.printFunction("handleResponse body", response.body, "");
  //     return ServerResponse.fromJson(response.body);
  //   }
  // }

}
// Future<DistanceMatrix> getRequestWithFullUrl(String url, {Map query}) async {
//   try {
//     var response = await dio.Dio().get(url, queryParameters: query);
//     print("getRequestWithFullUrl $response");
//     DistanceMatrix distanceMatrix = DistanceMatrix.fromJson(response.data);
//     return distanceMatrix;
//   } catch (e) {
//     print("getRequestWithFullUrl error: $e");
//     return Future.error(e);
//   }
// }

/// PLEASE DO NOT DELETE ///
/*httpClient.addRequestModifier((request) {
      request.headers['apikey'] = '12345678';
      return request;
    });*/
/*httpClient.addAuthenticator((request) async {
      final response = await get("http://yourapi/token");
      final token = response.body['token'];
      request.headers['Authorization'] = "$token";
      request.headers['Accept'] = "application/json";
      return request;
    });*/
/*httpClient.addResponseModifier<CasesModel>((request, response) {
      CasesModel model = response.body;
      if (model.countries.contains('Brazil')) {
        model.countries.remove('Brazilll');
      }
    });*/
