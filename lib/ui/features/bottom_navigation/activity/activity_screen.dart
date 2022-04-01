import 'package:flutter/material.dart';
import 'package:gallery_test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:gallery_test_task_flutter_getx/utils/dimens.dart';
import 'package:gallery_test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import 'activity_screen_controller.dart';

class ActivityScreen extends StatefulWidget {
  final IconData? iconData;

  const ActivityScreen({Key? key, this.iconData}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  final _controller = Get.put(AllCategoriesController());
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void didUpdateWidget(ActivityScreen oldWidget) {
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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      appBar: appBarMain(context, title: "Activity".tr, hideRightIcon: false),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
        height: screenHeight,
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
