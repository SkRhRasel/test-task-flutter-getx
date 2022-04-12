import 'package:flutter/material.dart';
import 'package:test_task_flutter_getx/utils/common_utils.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _controller.getCryptoData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBarMain(context, title: "Home".tr, hideRightIcon: false),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textAutoSizeDMSans(
                  text: 'Disclaimer: ',
                  textAlign: TextAlign.left,
                  fontSize: 12),
              Obx(() {
                return textAutoSizePoppins(
                    fontSize: 12,
                    maxLines: 5,
                    text: stringNullCheck(_controller
                        .cryptoInfoResponse.value.disclaimer
                        .toString()));
              }),
              const SizedBox(height: 15),
              textAutoSizeDMSans(
                  text: 'Last 30 days Maximum price and date: ',
                  textAlign: TextAlign.left,
                  fontSize: 12),
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textAutoSizePoppins(
                        fontSize: 12,
                        maxLines: 10,
                        text: 'Price: \$' +
                            _controller.maxValueFinal.value.toString()),
                    textAutoSizePoppins(
                        fontSize: 12,
                        maxLines: 10,
                        text: 'Date: ' + _controller.maxKeyFinal.value.toString()),
                  ],
                );
              }),
              // Obx(() {
              //   return textAutoSizePoppins(
              //       fontSize: 12,
              //       maxLines: 10,
              //       text: stringNullCheck(
              //           _controller.cryptoInfoResponse.value.bpi.toString()));
              // }),
              const SizedBox(height: 15),
              textAutoSizeDMSans(
                  text: 'Last 30 days lowest price and date: ',
                  textAlign: TextAlign.left,
                  fontSize: 12),
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textAutoSizePoppins(
                        fontSize: 12,
                        maxLines: 10,
                        text: 'Price: \$' +
                            _controller.minValueFinal.value.toString()),
                    textAutoSizePoppins(
                        fontSize: 12,
                        maxLines: 10,
                        text: 'Date: ' + _controller.minKeyFinal.value.toString()),
                  ],
                );
              }),
              // Obx(() {
              //   return textAutoSizePoppins(
              //       fontSize: 12,
              //       maxLines: 10,
              //       text: stringNullCheck(_controller.maxValueFinal.toString()));
              // }),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
