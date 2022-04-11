import 'package:get/get.dart';
import 'package:test_task_flutter_getx/data/models/cryptoResponse.dart';
import 'package:test_task_flutter_getx/data/remote/api_repository.dart';

import '../../../../utils/common_utils.dart';

class HomeController extends GetxController {
  Rx<CryptoInfo> cryptoInfoResponse = CryptoInfo().obs;

  void getCryptoData() {
    showLoadingDialog(isDismissible: true);
    String thirtyDays = DateTime.now().subtract(const Duration(days: 30)) as String;
    String todayDate = DateTime.now() as String;

    APIRepository().getCryptoData(thirtyDays, todayDate).then((resp) {
      hideLoadingDialog();
      try {
        cryptoInfoResponse.value = resp;
      } catch (e) {
        printError();
      }
    }, onError: (err) {
      showToast(err.toString());
    });
  }
}
