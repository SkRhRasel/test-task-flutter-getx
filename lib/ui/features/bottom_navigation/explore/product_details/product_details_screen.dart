import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_flutter_getx/data/models/list_response.dart';
import 'package:test_task_flutter_getx/ui/features/bottom_navigation/explore/explore_controller.dart';
import 'package:test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:test_task_flutter_getx/utils/dimens.dart';
import 'package:test_task_flutter_getx/utils/image_util.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({Key? key,required this.product}) : super(key: key);

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
        appBar: buildAppBarWithBack(context, title: widget.product.brand, hideRightIcon: true),
        body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: dp15),
                child:
                SizedBox(
                  height: 234,
                  // width: 32,
                  child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(Dimens.borderRadiusExtraLarge),
                      child: imageViewNetwork(
                          imagePath: widget.product.thumbnail, boxFit: BoxFit.cover)),
                ),
              ),
            )));
  }


}
