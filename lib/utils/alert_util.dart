import 'package:flutter/material.dart';
import 'package:test_task_flutter_getx/data/models/list_response.dart';
import 'package:test_task_flutter_getx/utils/image_util.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import '../data/local/constants.dart';
import '../ui/features/bottom_navigation/explore/product_details/product_details_screen.dart';
import 'button_util.dart';
import 'decorations.dart';
import 'dimens.dart';

void alertForProductView(BuildContext context, Product product) {
  Get.defaultDialog(
    title: "",
    radius: 10,
    backgroundColor: Colors.transparent,
    content: Container(
      height: 385,
      width: Get.width,
      padding: const EdgeInsets.all(Dimens.paddingLarge),
      decoration: getRoundSoftTransparentBox(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimens.borderRadius),
                        child: imageViewNetwork(
                            imagePath: product.thumbnail,
                            boxFit: BoxFit.cover,
                            height: 32,
                            width: 32)),
                  )),
              const SizedBox(width: Dimens.gapMin),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textAutoSizeDMSans(text: product.title.toString()),
                    textAutoSizePoppins(context,
                        text: product.category.toString())
                  ],
                ),
              ),
              // const SizedBox(width: Dimens.gapMin),
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 35,
                    decoration: boxDecorationRoundCorner(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        imageView(imagePath: AssetConstants.icAddUser),
                        const SizedBox(width: Dimens.gapExtraMin),
                        textAutoSize(text: 'Follow'),
                      ],
                    ),
                  ))
            ],
          ),
          const SizedBox(height: Dimens.gapMin),
          SizedBox(
            height: 234,
             width: Get.width,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(Dimens.borderRadiusExtraLarge),
                child: imageViewNetwork(
                    imagePath: product.thumbnail, boxFit: BoxFit.cover)),
          ),
          const SizedBox(height: Dimens.gapMin),
          buttonRoundedMain(
              text: "View Post",
              onPressCallback: () {
                Get.to(() => ProductDetailsScreen(product: product));
              }),
          const SizedBox(height: Dimens.gapMin),
        ],
      ),
    ),
  );
}
