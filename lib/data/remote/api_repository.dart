import 'package:get/get.dart';
import 'package:test_task_flutter_getx/data/models/list_response.dart';
import '../local/constants.dart';
import '../models/cryptoResponse.dart';
import 'api_provider.dart';

class APIRepository {
  final provider = Get.put(APIProvider());

  /// *** GET requests *** ///
  Future<ListResponse> getProductList(int total) async {
    var mapObj = <String, String>{};
    mapObj[APIConstants.kTotal] = "$total";
    mapObj[APIConstants.kLimit] = DefaultValue.listLimitLarge.toString();
    return provider.getRequest(APIConstants.baseUrl);
  }

  Future<CryptoInfo> getCryptoData() async{
    var mapObj = <String, String>{};
    return provider.getRequestForCryptoData(APIConstants.baseUrlForCrypto);
  }

}
