import 'package:flutter/material.dart';
import 'package:test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:test_task_flutter_getx/utils/dimens.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import 'fab_controller.dart';

class FabScreen extends StatefulWidget {
  const FabScreen({Key? key}) : super(key: key);

  @override
  _FabScreenState createState() => _FabScreenState();
}

class _FabScreenState extends State<FabScreen> {
  final _controller = Get.put(FabController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {});
  }

  @override
  void dispose() {
    _controller.clearView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBarMain(context, title: "Fab".tr, hideRightIcon: false),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: textAutoSizePoppins(context, fontSize: 24, text: 'Fab Screen'.tr)),
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
        textAutoSizePoppins(context,
            text: '0.366255'.tr,
            textAlign: TextAlign.left,
            color: Get.theme.errorColor),
        textAutoSizePoppins(
          context,
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
        textAutoSizePoppins(context,
            text: '0.366255'.tr,
            textAlign: TextAlign.left,
            color: Get.theme.colorScheme.secondary),
        textAutoSizePoppins(
          context,
          text: '0.366255'.tr,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
