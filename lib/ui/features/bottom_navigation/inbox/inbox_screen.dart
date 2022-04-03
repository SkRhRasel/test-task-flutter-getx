import 'package:flutter/material.dart';
import 'package:test_task_flutter_getx/data/local/constants.dart';
import 'package:test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:test_task_flutter_getx/utils/dimens.dart';
import 'package:test_task_flutter_getx/utils/image_util.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import 'inbox_controller.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final InboxController _controller =
      Get.put(InboxController());

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
      appBar: appBarMain(context, title: "Inbox".tr, hideRightIcon: false),
      body: SizedBox(
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: _controller.getData,
                child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.paddingLarge),
                    child: Column(
                      children: [
                        ExpansionTile(
                          title:
                          textAutoSizeDMSans(context, text: "BTC/USDT Chart".tr),
                          backgroundColor: Colors.transparent,
                          collapsedIconColor: Get.theme.primaryColorLight,
                          collapsedBackgroundColor: Colors.transparent,
                          iconColor: Get.theme.primaryColorLight,
                          tilePadding: const EdgeInsets.all(0),
                          childrenPadding: const EdgeInsets.all(0),
                          children: <Widget>[
                            imageView(imagePath: AssetConstants.btcChart),
                          ],
                        ),
                        const SizedBox(height: Dimens.gapMid),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
