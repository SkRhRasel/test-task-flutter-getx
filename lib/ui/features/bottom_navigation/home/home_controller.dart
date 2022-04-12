import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_task_flutter_getx/data/models/cryptoResponse.dart';
import 'package:test_task_flutter_getx/data/remote/api_repository.dart';
import '../../../../utils/common_utils.dart';

class HomeController extends GetxController {
  Rx<CryptoInfo> cryptoInfoResponse = CryptoInfo().obs;
  RxDouble maxValueFinal = 0.0.obs;
  var maxKeyFinal = "".obs;
  RxDouble minValueFinal = 0.0.obs;
  var minKeyFinal = "".obs;

  void getCryptoData() {
    showLoadingDialog();
    var thirtyDays = DateTime.now().subtract(const Duration(days: 30));
    var todayDate = DateTime.now();
    String formatThirtyDays = DateFormat("yyyy-MM-dd").format(thirtyDays);
    String formatTodayDate = DateFormat("yyyy-MM-dd").format(todayDate);

    APIRepository().getCryptoData(formatThirtyDays, formatTodayDate).then(
        (resp) {
      hideLoadingDialog();
      cryptoInfoResponse.value = resp;
      Map themap = cryptoInfoResponse.value.bpi!.cast<String, dynamic>();

      ///For lowest maximum calculation
      var maxValue = 0.0;
      var maxKey;
      themap.forEach((k, v) {
        if (v > maxValue) {
          maxValue = v;
          maxKey = k;
        }
      });
      maxValueFinal.value = maxValue;
      maxKeyFinal.value = maxKey;

      ///For lowest value calculation
      var minValue = double.infinity;
      var minKey;
      themap.forEach((k, v) {
        if (v < minValue) {
          minValue = v;
          minKey = k;
        }
      });

      minValueFinal.value = minValue;
      minKeyFinal.value = minKey;

      print("Date: " + maxKey);
      print(maxValue);
      print("Date: " + minKey);
      print(minValue);


    }, onError: (err) {
      hideLoadingDialog();
      showToast(err.toString());
    });
  }
}
