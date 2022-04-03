import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../local/constants.dart';
import '../models/response.dart';

class APIProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = APIConstants.baseUrl;
    httpClient.maxAuthRetries = 3;
    httpClient.timeout = const Duration(seconds: 120);
    super.onInit();
  }

  /// *** Common Server Request *** ///

  // Future<ServerResponse> getRequest(String url, Map<String, String> headers, {Map<String, dynamic>? query}) async {
  //   GetUtils.printFunction("getRequest query", query, "");
  //   GetUtils.printFunction("getRequest headers", headers, "");
  //   final response = await get(url, headers: headers, query: query);
  //   GetUtils.printFunction("getRequest url ", response.request?.url, "");
  //   return handleResponse(response);
  // }
  Future<List<dynamic>> getImageList() async {
    final response = await get(APIConstants.baseUrl);
    if (response.status.hasError){
      return Future.error(response.statusText!);
    }else{
      return response.body[APIConstants.products];
    }
  }

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
