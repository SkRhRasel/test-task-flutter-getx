import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_task_flutter_getx/root/root_screen.dart';
import 'package:test_task_flutter_getx/utils/button_util.dart';
import 'package:test_task_flutter_getx/utils/decorations.dart';
import 'package:test_task_flutter_getx/utils/shared_pref_utils.dart';
import 'package:get/get.dart';
import '../../../data/local/constants.dart';
import '../../../utils/dimens.dart';
import '../../../utils/text_util.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: Dimens.paddingMid),
      height: Dimens.paddingMid,
      width: Dimens.paddingMid,
      // width: isActive ? Dimens.paddingMid : Dimens.paddingMid,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).focusColor
            : Theme.of(context).primaryColor,
        border:
            Border.all(color: Theme.of(context).primaryColorLight, width: 2),
        borderRadius: const BorderRadius.all(Radius.elliptical(10, 10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: PageView(
        physics: const ClampingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          buildOnBoardingPage(
              AssetConstants.onBoarding0,
              "kOnBoardingTitle_0".tr,
              "kOnBoardingDescription_0".tr,
              _currentPage),
          buildOnBoardingPage(
              AssetConstants.onBoarding1,
              "kOnBoardingTitle_1".tr,
              "kOnBoardingDescription_1".tr,
              _currentPage),
          buildOnBoardingPage(
              AssetConstants.onBoarding2,
              "kOnBoardingTitle_2".tr,
              "kOnBoardingDescription_2".tr,
              _currentPage),
        ],
      ),
    );
  }

  Widget buildOnBoardingPage(
      String onBoardingLogo, String title, String description, int page) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: getBackgroundImageDecoration(imagePath: AssetConstants.bgOnBoarding),
      height: screenHeight,
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.paddingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  // const SizedBox(height: Dimens.gapExtraMid),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Align(alignment: Alignment.centerRight,
                      child: textAutoSizePoppins(context,
                          text: page == 2 ? '' : 'Skip'.tr, textAlign: TextAlign.right,
                          color: Theme.of(context).primaryColor,
                          fontSize: Dimens.regularFontSizeExtraMid, onTap: () {
                        SharedPrefUtil.writeBoolean(PrefKeyConstant.kIsOnBoardingDone, true);
                        Get.off(() => const RootScreen(), transition: Transition.leftToRightWithFade);
                      }),
                    ),
                  ),
                  Image.asset(onBoardingLogo,
                      width: screenWidth / 1.40,
                      height: screenWidth / 1.40,
                      fit: BoxFit.cover),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textAutoSizeDMSans(context,
                      text: title,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      fontSize: Dimens.titleFontSizeLarge,
                      color: Theme.of(context).primaryColorDark),
                  const SizedBox(height: Dimens.gapLarge),
                  textAutoSizeBodyMedium(context,
                      text: description, maxLines: 5),
                  const SizedBox(height: Dimens.gapMid),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator()),
                  const SizedBox(height: Dimens.gapLarge),
                  buttonRoundedMain(
                      text: "Next".tr,
                      onPressCallback: () {
                        _pageController.animateToPage(_currentPage + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                        if (kDebugMode) {
                          print(_currentPage);
                        }
                        if (_currentPage == 2) {
                          SharedPrefUtil.writeBoolean(PrefKeyConstant.kIsOnBoardingDone, true);
                          Get.off(() => const RootScreen(), transition: Transition.leftToRightWithFade);
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}