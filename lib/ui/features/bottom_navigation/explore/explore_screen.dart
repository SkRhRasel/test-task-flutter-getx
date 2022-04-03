import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:test_task_flutter_getx/data/local/constants.dart';
import 'package:test_task_flutter_getx/data/models/imageList.dart';
import 'package:test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:test_task_flutter_getx/utils/decorations.dart';
import 'package:test_task_flutter_getx/utils/dimens.dart';
import 'package:test_task_flutter_getx/utils/image_util.dart';
import 'package:test_task_flutter_getx/utils/text_field_util.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import 'package:test_task_flutter_getx/utils/widgets.dart';
import 'explore_controller.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final ExploreController _controller = Get.put(ExploreController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _controller.getAllReceiveCoinHistoryList(false);
    });
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
      appBar: appBarMain(context, title: "Explore".tr, hideRightIcon: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: Dimens.paddingMin),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
              child: textFieldWithPrefixIcon(context,
                  labelText: 'Search in Swipexyz..'.tr,
                  controller: _controller.searchController,
                  hint: "Search in Swipexyz..".tr,
                  bgColor: Get.theme.dividerColor,
                  type: TextInputType.text,
                  prefixIconIconPath: AssetConstants.icSearch,
                  borderRadius: Dimens.borderRadiusLarge),
            ),
            const SizedBox(height: Dimens.gapMin),
            horizontalDivider(),
            const SizedBox(height: Dimens.gapMin),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: dp16),
                height: Get.height,
                child: _imageList(),
              ),
            ),
            const SizedBox(height: Dimens.gapMin),
          ],
        ),
      ),
    );
  }

  Widget _imageList() {
    return Obx(() {
      String message = "empty_message_receive_coin_history_list".tr;
      return _controller.imageList.isEmpty
          ? handleEmptyViewWithLoading(_controller.isLoading, message: message)
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _controller.imageList.length,
              itemBuilder: (BuildContext context, int index) {
                // if (_controller.hasMoreData && index == (_controller.imageList.length - 1)) {
                //   WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                //      _controller.getAllReceiveCoinHistoryList(true);
                //   });
                // }
                // return imageItem(_controller.imageList[index]);
                return Card(child: Column(
                  children: [
                    ListTile(title: imageList[index][''],)
                  ],
                ),);
              },
            );
    });
  }

  Widget imageItem(ImageList imageList) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: dp20, horizontal: dp15),
      decoration: getRoundSoftTransparentBox(),
      margin: EdgeInsets.symmetric(horizontal: dp0, vertical: dp5),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // imageViewNetwork(imagePath: imageList.products!.thumbnail!)
        ],
      ),
    );
  }
}
