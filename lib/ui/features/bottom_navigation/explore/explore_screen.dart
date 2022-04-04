import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:test_task_flutter_getx/data/local/constants.dart';
import 'package:test_task_flutter_getx/data/models/imageList.dart';
import 'package:test_task_flutter_getx/data/models/list_response.dart';
import 'package:test_task_flutter_getx/ui/features/notifications/notifications_screen.dart';
import 'package:test_task_flutter_getx/utils/alert_util.dart';
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
      _controller.getAllImageList(false);
      // _controller.getAllProductList();
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              // child: _imageListStaggeredGridView(),
              child: _imageList(),
            ),
            const SizedBox(height: Dimens.gapMin),
          ],
        ),
      ),
    );
  }

  Widget _imageList() {
    return Obx(() {
      String message = "Data Not Found".tr;
      return _controller.productList.isEmpty
          ? handleEmptyViewWithLoading(_controller.isLoading, message: message)
          : SizedBox(
              height: Get.height -
                  (Get.bottomBarHeight + Get.statusBarHeight + 155),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // childAspectRatio: 0.895,
                    crossAxisCount: 3,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _controller.productList.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_controller.hasMoreData &&
                      index == (_controller.productList.length - 1)) {
                    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                      _controller.getAllImageList(true);
                    });
                  }
                  return imageItem(_controller.productList[index]);
                },
              ));
    });
  }

  Widget imageItem(Product product) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.borderRadiusExtraLarge),
      // padding: EdgeInsets.all(10),
      // decoration: getRoundSoftTransparentBox(radius: 20),
      child: imageViewNetwork(
          imagePath: product.thumbnail!,
          boxFit: BoxFit.cover,
          height: 95,
          onPressCallback: () {
            alertForProductView(context, product);
            // Get.to(() => const NotificationsScreen());
          }),
    );
  }

  Widget _imageListStaggeredGridView() {
    return Obx(() {
      String message = "empty_message".tr;
      return _controller.productList.isEmpty
          ? handleEmptyViewWithLoading(_controller.isLoading, message: message)
          : SizedBox(
              height: Get.height - dp160,
              // height: Get.height - (Get.bottomBarHeight + Get.statusBarHeight + 325),
              child: GridView.custom(
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 2),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // if (_controller.hasMoreData && index == (_controller.productList.length - 1)) {
                    //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                    //     // _controller.getAllImageList(true);
                    //     _controller.getAllProductList();
                    //   });
                    // }
                    // _controller.getAllProductList();
                    return imageItem(_controller.productList[index]);
                  },
                ),
              ));
    });
  }
}
