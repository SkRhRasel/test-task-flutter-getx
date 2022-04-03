import 'package:flutter/material.dart';
import 'package:test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:test_task_flutter_getx/utils/dimens.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import 'shop_screen_controller.dart';

class ShopScreen extends StatefulWidget {
  final IconData? iconData;

  const ShopScreen({Key? key, this.iconData}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with TickerProviderStateMixin {
  final _controller = Get.put(ShopController());
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void didUpdateWidget(ShopScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.iconData != widget.iconData) {
      _startAnimation();
    }
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {});
  }

  _startAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.clearView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      appBar: appBarMain(context, title: "Shop".tr, hideRightIcon: false),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
        height: Get.height,
        child: Column(
          children: [
            const SizedBox(height: Dimens.gapMin),
            textAutoSizeDMSans(context, fontSize: 24, text: 'Overview'.tr),
          ],
        ),
      ),
    );
  }
}
