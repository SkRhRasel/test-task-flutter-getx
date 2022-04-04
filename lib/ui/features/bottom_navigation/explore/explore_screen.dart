import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_flutter_getx/data/local/constants.dart';
import 'package:test_task_flutter_getx/data/models/list_response.dart';
import 'package:test_task_flutter_getx/utils/alert_util.dart';
import 'package:test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:test_task_flutter_getx/utils/dimens.dart';
import 'package:test_task_flutter_getx/utils/image_util.dart';
import 'package:test_task_flutter_getx/utils/text_field_util.dart';
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
}
