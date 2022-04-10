import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_flutter_getx/data/models/cryptoResponse.dart';
import 'package:test_task_flutter_getx/data/remote/api_repository.dart';

import '../../../../utils/common_utils.dart';

class HomeController extends GetxController {

  Rx<CryptoInfo> cryptoInfo = CryptoInfo().obs;

  void getCryptoData() {
    showLoadingDialog(isDismissible: true);
    APIRepository().getCryptoData().then((resp) {
      try{
        cryptoInfo.value = CryptoInfo.fromJson(resp.bpi);
      }catch (e) {
        printError();
      }
    }, onError: (err) {
      showToast(err.toString());
    });
  }



}
