import 'package:flutter/material.dart';
import 'package:gallery_test_task_flutter_getx/data/local/constants.dart';
import 'package:gallery_test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:gallery_test_task_flutter_getx/utils/dimens.dart';
import 'package:gallery_test_task_flutter_getx/utils/image_util.dart';
import 'package:gallery_test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import 'market_controller.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final FavoriteItemsController _controller =
      Get.put(FavoriteItemsController());

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
      appBar: appBarMain(context, title: "Market".tr, hideRightIcon: false),
      body: SizedBox(
        height: screenHeight,
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
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
