import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_task_flutter_getx/data/models/cryptoResponse.dart';
import 'package:test_task_flutter_getx/data/remote/api_repository.dart';

import '../../../../utils/common_utils.dart';

class HomeController extends GetxController {
  Rx<CryptoInfo> cryptoInfoResponse = CryptoInfo().obs;

  void getCryptoData() {
    // showLoadingDialog();
    var thirtyDays = DateTime.now().subtract(const Duration(days: 30));
    var todayDate = DateTime.now();
    String formatThirtyDays = DateFormat("yyyy-MM-dd").format(thirtyDays);
    String formatTodayDate = DateFormat("yyyy-MM-dd").format(todayDate);

    APIRepository().getCryptoData(formatThirtyDays, formatTodayDate).then((resp) {
      // hideLoadingDialog();
      cryptoInfoResponse.value = resp;
      try {

      } catch (e) {
        printError();
      }
    }, onError: (err) {
      showToast(err.toString());
    });
  }
}
