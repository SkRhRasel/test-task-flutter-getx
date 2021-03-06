import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:test_task_flutter_getx/data/models/list_response.dart';
import 'package:test_task_flutter_getx/ui/features/bottom_navigation/explore/explore_controller.dart';
import 'package:test_task_flutter_getx/utils/button_util.dart';
import 'package:test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:test_task_flutter_getx/utils/decorations.dart';
import 'package:test_task_flutter_getx/utils/dimens.dart';
import 'package:test_task_flutter_getx/utils/image_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:test_task_flutter_getx/utils/widgets.dart';
import '../../../../../data/local/constants.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final _controller = Get.put(ExploreController());

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _controller.getAllImageList(true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: buildAppBarWithBack(context,
            title: widget.product.brand, hideRightIcon: true),
        body: SafeArea(
            child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 234,
                      width: Get.width,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              Dimens.borderRadiusExtraLarge),
                          child: imageViewNetwork(
                              imagePath: widget.product.thumbnail,
                              boxFit: BoxFit.contain)),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: buttonRoundedWithIconSmall(
                            widget.product.discountPercentage.toString() +
                                ' % Off',
                            Icons.local_offer_outlined,
                            () {})),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: boxDecorationRoundCorner(),
                          child: textAutoSizeKarla(context, text: 'Price: \$'+
                              widget.product.price.toString()),
                        ))
                  ],
                ),
                const SizedBox(height: Dimens.gapMin),
                horizontalDivider(),
                const SizedBox(height: Dimens.gapMin),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: boxDecorationRoundBorder(color: kFollowBgColor.withOpacity(0.5),borderColor: Get.theme.dividerColor),
                    child: RatingBar.builder(
                      initialRating: widget.product.rating!,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      glow: true,
                      glowRadius: 5,
                      itemSize: 25,
                      itemCount: 5,
                      itemPadding:
                      const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    textAutoSizeDMSans(text: 'Brand: '),
                    textAutoSizePoppins(text: widget.product.brand.toString()),
                  ],
                ),
                Row(
                  children: [
                    textAutoSizeDMSans(text: 'category: '),
                    textAutoSizePoppins(text: widget.product.category.toString()),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textAutoSizeDMSans(text: 'Product Description: '),
                    textAutoSizePoppins(text: widget.product.description.toString(),maxLines: 10),
                  ],
                ),
                Row(
                  children: [
                    textAutoSizeDMSans(text: 'Stock: '),
                    textAutoSizePoppins(text: widget.product.stock.toString()),
                  ],
                ),
              ],
            ),
          ),
        )));
  }

  Widget _productImagesList() {
    return Obx(() {
      String message = "No Product Images".tr;
      return _controller.demoList.isEmpty
          ? handleEmptyViewWithLoading(_controller.isDataLoaded,
              message: message)
          : CarouselSlider(
              options: CarouselOptions(
                height: 250,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
              ),
              items: widget.product.images!.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return productSliderItem();
                  },
                );
              }).toList(),
            );
    });
  }

  Widget productSliderItem({double bottomPadding = 0}) {
    return Container(
        height: 260,
        decoration: getRoundCornerWithShadow(),
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: getRoundCornerBorderOnlyTop(bgColor: kFollowBgColor),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration:
                        getRoundCornerBorderOnlyTop(bgColor: kFollowBgColor),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                      ),
                      //child: getImage110(auction.productImageUrl, false),
                      child: widget.product.images!.isEmpty
                          ? imageView(
                              imagePath: AssetConstants.imgNotAvailable,
                              boxFit: BoxFit.cover,
                              width: 120)
                          : imageViewNetwork(
                              imagePath: widget.product.images.toString(),
                              boxFit: BoxFit.cover,
                              width: 120),
                    ),
                  ),
                  // Positioned(
                  //     top: 0,
                  //     right: 0,
                  //     child: buttonRoundedWithIconSmall(
                  //         "Live".tr, AssetConstants.icNotification, () {})),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  decoration: getRoundCornerBorderOnlyBottom(),
                  padding: const EdgeInsets.only(
                      left: 10, top: 0, right: 10, bottom: 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textAutoSize(text: "Title Demo"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            imageView(
                                imagePath: AssetConstants.icNotification,
                                height: 20,
                                width: 20),
                          ],
                        ),
                        Row(
                          children: [
                            imageView(
                                imagePath: AssetConstants.icNotification,
                                height: 20)
                          ],
                        )
                      ])))
        ]));
  }
}
