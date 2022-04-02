import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:test_task_flutter_getx/utils/toast_utils.dart';
import 'package:get/get.dart';

///Identifies Network Availability.
///Automated alert - flag controlled
///Things to change:
/// 1. Message Alert widget - can be left default, change as per UI design.

class NetworkCheck {

  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static Future<bool> isOnline({bool showError = true}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    if (showError) {

      ToastUtil.showToast("Please Check Internet Connection and Run the App Again".tr, isError: true,isLong: true);
    }
    return false;
  }

  dynamic checkInternet(Function func) {
    check().then((internet) {
      if (internet) {
        func(true);
      } else {
        func(false);
      }
    });
  }
}
