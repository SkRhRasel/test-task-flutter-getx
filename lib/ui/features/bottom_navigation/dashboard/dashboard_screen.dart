import 'package:flutter/material.dart';
import 'package:test_task_flutter_getx/data/local/constants.dart';
import 'package:test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:test_task_flutter_getx/utils/dimens.dart';
import 'package:test_task_flutter_getx/utils/image_util.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _controller = Get.put(DashboardController());

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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBarMain(context, title: "Dashboard".tr, hideRightIcon: false),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
        height: screenHeight,
        child: ListView(
          shrinkWrap: true,
          children: [
            RefreshIndicator(
              onRefresh: _controller.getData,
              child: Column(
                children: [
                  ExpansionTile(
                    title:
                    textAutoSizeDMSans(context, text: "BTC/USDT Chart".tr),
                    backgroundColor: Colors.transparent,
                    collapsedIconColor: Theme.of(context).primaryColorLight,
                    collapsedBackgroundColor: Colors.transparent,
                    iconColor: Theme.of(context).primaryColorLight,
                    tilePadding: const EdgeInsets.all(0),
                    childrenPadding: const EdgeInsets.all(0),
                    children: <Widget>[
                      imageView(imagePath: AssetConstants.btcChart),
                    ],
                  ),
                  const SizedBox(height: Dimens.gapMid),
                ],
              ),
            ),
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
            color: Theme.of(context).errorColor),
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
            color: Theme.of(context).colorScheme.secondary),
        textAutoSizePoppins(
          context,
          text: '0.366255'.tr,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
