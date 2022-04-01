import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gallery_test_task_flutter_getx/root/root_screen.dart';
import 'package:gallery_test_task_flutter_getx/ui/features/on_boarding/on_boarding_screen.dart';
import 'package:gallery_test_task_flutter_getx/utils/decorations.dart';
import 'package:gallery_test_task_flutter_getx/utils/shared_pref_utils.dart';
import 'package:gallery_test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import '../../../data/local/constants.dart';
import '../../../utils/dimens.dart';
import '../../../utils/image_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   NetworkCheck.isOnline().then((value) {
  //     if (value) {
  //       Future.delayed(const Duration(seconds: 1), () {
  //         if(GetStorage().read(PrefKeyConstant.isLoggedIn)) {
  //           Get.off(() => const RootScreen());
  //         } else if (!GetStorage().read(PrefKeyConstant.isOnBoardingShow)) {
  //           Get.off(() => OnBoardingPage());
  //         } else {
  //           Get.off(() => const WelcomePage());
  //         }
  //       });
  //     }
  //   });
  // }

  @override
  void didChangeDependencies() {
    Timer(const Duration(seconds: 3), () async {
      var isOnBoarding = await SharedPrefUtil.getBoolean(PrefKeyConstant.kIsOnBoardingDone);
      if (!isOnBoarding) {
        Get.off(() => const OnBoardingScreen(), transition: Transition.leftToRightWithFade);
      }else{
        Get.off(() => const RootScreen(),transition: Transition.leftToRightWithFade);
      }
    });
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0),
        decoration: getBackgroundImageDecoration(imagePath: AssetConstants.bgSplash),
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageView(
                imagePath: AssetConstants.icLogo,
                height: dp130,
                width: dp130),
            const SizedBox(height: Dimens.gapLarge),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: textAutoSizeHeadlineMedium(context,text: 'splashLogoSubText'.tr),
            ),
          ],
        ),
      )
    );
  }
// @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: GetBuilder<SplashController>(
  //         // specify type as Controller
  //         init: SplashController(), // initialize with the Controller
  //         builder: (splashController) {
  //           return Container(
  //             padding: const EdgeInsets.all(0),
  //             decoration: bgSplash,
  //             width: MediaQuery.of(context).size.width,
  //             height: MediaQuery.of(context).size.height,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 imageView(
  //                     imagePath: AssetConstants.icLogo,
  //                     height: dp130,
  //                     width: dp130),
  //                 const SizedBox(height: Dimens.contentHeightGap),
  //                 textAutoSizeHeadlineMedium(text: 'splashLogoSubText'.tr),
  //               ],
  //             ),
  //           );
  //         }),
  //   );
  // }
}
