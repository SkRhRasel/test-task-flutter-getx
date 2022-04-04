import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/local/constants.dart';
import '../ui/features/notifications/notifications_screen.dart';
import 'button_util.dart';
import 'dimens.dart';
import 'text_util.dart';

AppBar appBarMain(BuildContext context,
    {String? title, bool hideRightIcon = false}) {
  return AppBar(
    backgroundColor: Get.theme.backgroundColor,
    elevation: 0,
    centerTitle: true,
    leading: buttonOnlyIcon(
        onPressCallback: () {
          Scaffold.of(context).openDrawer();
        },
        iconPath: AssetConstants.icMenu,
        size: 25,
        iconColor: Get.theme.primaryColorDark),
    title: textAutoSize(
        text: title!,
        maxLines: 1,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w600,
        fontSize: 20),
    actions: [
      hideRightIcon
          ? Container(width: 25)
          : buttonOnlyIcon2(
              onPressCallback: () {
                Get.to(() => const NotificationsScreen());
              },
              iconPath: AssetConstants.icNotification),
    ],
  );
}

AppBar buildAppBarWithBack(BuildContext context,
    {String? title, bool hideRightIcon = false}) {
  return AppBar(
    backgroundColor: Get.theme.backgroundColor,
    elevation: 0,
    centerTitle: true,
    leading: buttonOnlyIcon2(
        onPressCallback: () {
          Get.back();
        },
        // icon: Icons.chevron_left,
        iconPath: AssetConstants.icArrowLeft,
        size: Dimens.iconSize,
        iconColor: Get.theme.primaryColorDark),
    title: textAutoSize(
        text: title!,
        maxLines: 1,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w600,
        fontSize: 20),
    actions: [
      hideRightIcon
          ? Container(width: 25)
          : buttonOnlyIcon2(
              onPressCallback: () {
                // Get.to(() => const NotificationsPage());
              },
              iconPath: AssetConstants.icNotification,
              iconSize: 24),
    ],
  );
}
