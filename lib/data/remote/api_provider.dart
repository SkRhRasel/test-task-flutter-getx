// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import '../local/constants.dart';
// import '../models/response.dart';
//
// class APIProvider extends GetConnect {
//   @override
//   void onInit() {
//     httpClient.baseUrl = APIConstants.baseUrl;
//     httpClient.maxAuthRetries = 3;
//     httpClient.timeout = const Duration(seconds: 120);
//     super.onInit();
//   }
//
//   /// *** Common Server Request *** ///
//   Future<ServerResponse> postRequest(String url, Map body, Map<String, String> headers) async {
//     GetUtils.printFunction("postRequest body", body, "");
//     GetUtils.printFunction("getRequest headers", headers, "");
//     final response = await post(url, body, headers: headers);
//     GetUtils.printFunction("postRequest url", response.request?.url, "");
//     return handleResponse(response);
//   }
//
//   Future<ServerResponse> getRequest(String url, Map<String, String> headers, {Map<String, dynamic>? query}) async {
//     GetUtils.printFunction("getRequest query", query, "");
//     GetUtils.printFunction("getRequest headers", headers, "");
//     final response = await get(url, headers: headers, query: query);
//     GetUtils.printFunction("getRequest url ", response.request?.url, "");
//     return handleResponse(response);
//   }
//
//   Future<ServerResponse> postRequestFormData(String url, Map<String, dynamic> body, Map<String, String> headers) async {
//     final response = await post(url, FormData(body), headers: headers);
//     GetUtils.printFunction("uploadFile", response.request?.url, "url");
//     GetUtils.printFunction("uploadFile", body, "body");
//     GetUtils.printFunction("uploadFile", headers, "headers");
//     return handleResponse(response);
//   }
//
//   Future<ServerResponse> uploadFile(String url, List<int> img, String filename,
//       Map<String, String> headers) async {
//     final avatar = MultipartFile(img, filename: filename);
//     final response = await post(
//         url, FormData({APIConstants.kProfilePhotoPath: avatar}),
//         headers: headers);
//     GetUtils.printFunction("uploadFile url", response.request?.url, "");
//     return handleResponse(response);
//   }
//
//   Future<ServerResponse> handleResponse(Response response) async {
//     if (response.statusCode == 401) {
//       final storage = GetStorage();
//       storage.erase();
//       Get.back();
//       Get.off(const SignInPage());
//       return Future.error(response.statusText as String);
//     }
//
//     if (response.status.hasError) {
//       GetUtils.printFunction(
//           "handleResponse statusText", response.statusText, "");
//       return Future.error(response.statusText as String);
//     } else {
//       GetUtils.printFunction("handleResponse body", response.body, "");
//       return ServerResponse.fromJson(response.body);
//     }
//   }
// }
// // Future<DistanceMatrix> getRequestWithFullUrl(String url, {Map query}) async {
// //   try {
// //     var response = await dio.Dio().get(url, queryParameters: query);
// //     print("getRequestWithFullUrl $response");
// //     DistanceMatrix distanceMatrix = DistanceMatrix.fromJson(response.data);
// //     return distanceMatrix;
// //   } catch (e) {
// //     print("getRequestWithFullUrl error: $e");
// //     return Future.error(e);
// //   }
// // }
//
// /// PLEASE DO NOT DELETE ///
// /*httpClient.addRequestModifier((request) {
//       request.headers['apikey'] = '12345678';
//       return request;
//     });*/
// /*httpClient.addAuthenticator((request) async {
//       final response = await get("http://yourapi/token");
//       final token = response.body['token'];
//       request.headers['Authorization'] = "$token";
//       request.headers['Accept'] = "application/json";
//       return request;
//     });*/
// /*httpClient.addResponseModifier<CasesModel>((request, response) {
//       CasesModel model = response.body;
//       if (model.countries.contains('Brazil')) {
//         model.countries.remove('Brazilll');
//       }
//     });*/
