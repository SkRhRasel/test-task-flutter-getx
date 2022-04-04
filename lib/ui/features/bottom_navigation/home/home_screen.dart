import 'package:flutter/material.dart';
import 'package:test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:test_task_flutter_getx/utils/dimens.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBarMain(context, title: "Home".tr, hideRightIcon: false),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: textAutoSizePoppins( fontSize: 24, text: 'Home Screen'.tr)),
          ],
        ),
      ),
    );
  }

  Widget _tabItem(String title) {
    return Tab(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget priceRowItemsRed() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textAutoSizePoppins(
            text: '0.366255'.tr,
            textAlign: TextAlign.left,
            color: Get.theme.errorColor),
        textAutoSizePoppins(
          text: '0.366255'.tr,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }

  Widget priceRowItemsGreen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textAutoSizePoppins(
            text: '0.366255'.tr,
            textAlign: TextAlign.left,
            color: Get.theme.colorScheme.secondary),
        textAutoSizePoppins(
          text: '0.366255'.tr,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
