import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/network_util.dart';
import '../on_boarding/on_boarding_screen.dart';

// class SplashController extends GetxController {
//
//   @override
//   void onReady() {
//     super.onReady();
//     NetworkCheck.isOnline().then((value) {
//       if (value) {
//         Future.delayed(const Duration(seconds: 1), () {
//           if(GetStorage().read(PrefKeyConstant.isLoggedIn)) {
//             Get.off(() => const RootScreen());
//           } else if (!GetStorage().read(PrefKeyConstant.kIsOnBoardingDone)) {
//             Get.off(() => OnBoardingScreen());
//           } else {
//             Get.off(() => const WelcomePage());
//           }
//         });
//       }
//     });
//
//   }
//
// }