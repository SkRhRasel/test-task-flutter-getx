import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/local/constants.dart';
import 'button_util.dart';
import 'dimens.dart';
import 'dart:io' show Platform;

import 'text_util.dart';

// AppBar appBarMain(BuildContext context,
//     {String? title, bool hideRightIcon = false}) {
//   return AppBar(
//     backgroundColor: Get.theme.backgroundColor,
//     elevation: 0,
//     centerTitle: true,
//     leading: buttonOnlyIcon(
//         onPressCallback: () {
//           Scaffold.of(context).openDrawer();
//         },
//         iconPath: AssetConstants.icMenu,
//         size: dp25,
//         iconColor: Get.theme.primaryColorDark),
//     title: textAutoSize(context,
//         text: title!,
//         maxLines: 1,
//         textAlign: TextAlign.center,
//         fontWeight: FontWeight.w600,
//         fontSize: 20),
//     actions: [
//       hideRightIcon
//           ? Container(width: dp25)
//           : buttonOnlyIcon2(
//               onPressCallback: () {
//                 Get.to(() => const NotificationsPage());
//               },
//               iconPath: AssetConstants.icNotification),
//     ],
//   );
// }
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
        size: dp25,
        iconColor: Get.theme.primaryColorDark),
    title: textAutoSize(context,
        text: title!,
        maxLines: 1,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w600,
        fontSize: 20),
    actions: [
      hideRightIcon
          ? Container(width: dp25)
          : buttonOnlyIcon2(
              onPressCallback: () {
                // Get.to(() => const NotificationsPage());
              },
              iconPath: AssetConstants.icNotification),
    ],
  );
}
AppBar appBarMain2(BuildContext context,
    {String? title, bool hideRightIcon = false}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    toolbarHeight: 70,
    leading: Container(
      margin: const EdgeInsets.only(top: 0.0),
      child: buttonOnlyIcon(
          onPressCallback: () {
            Scaffold.of(context).openDrawer();
          },
          iconPath: AssetConstants.icMenu,
          size: 24,
          iconColor: Theme.of(context).primaryColorLight),
    ),
    // flexibleSpace: const Image(
    //   image: AssetImage(AssetConstants.bgAppBar2),
    //   fit: BoxFit.cover,
    // ),
    // bottom: const PreferredSize(
    //   preferredSize: Size.fromHeight(0),
    //   child: SizedBox(height: 0),
    // ),
    // flexibleSpace: const FlexibleSpaceBar(
    //     titlePadding: EdgeInsets.all(38.0),
    //     centerTitle: true,
    //     collapseMode: CollapseMode.pin,
    //     background: Image(
    //       height: 533,
    //       image: AssetImage(AssetConstants.bgAppBar2),
    //       fit: BoxFit.cover,
    //     )),
    title: Container(
      margin: const EdgeInsets.only(top: 0.0),
      child: textAutoSize(context,
          text: title!,
          maxLines: 1,
          color: Theme.of(context).primaryColorLight,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
          fontSize: 20),
    ),
    actions: [
      Container(
        margin: const EdgeInsets.only(top: 0.0),
        child: hideRightIcon
            ? Container(width: dp25)
            : buttonOnlyIcon2(
            onPressCallback: () {
              // Get.to(() => const NotificationsPage());
            },
            size: 24,
            iconPath: AssetConstants.icNotification,iconColor: Theme.of(context).primaryColorLight),
      ),
    ],
  );
}
// AppBar appBarMain(BuildContext context,
//     {String? title, bool hideRightIcon = false}) {
//   return AppBar(
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     centerTitle: true,
//     toolbarHeight: 65,
//     leading: Container(
//       margin: Platform.isAndroid ? const EdgeInsets.only(top:35.0) : const EdgeInsets.only(top:20.0),
//       child: buttonOnlyIcon(
//           onPressCallback: () {
//             Scaffold.of(context).openDrawer();
//           },
//           iconPath: AssetConstants.icMenu,
//           size: 24,
//           iconColor: Theme.of(context).primaryColorLight),
//     ),
//     flexibleSpace: const Image(
//       image: AssetImage(AssetConstants.bgAppBar2),
//       fit: BoxFit.cover,
//     ),
//     // bottom: const PreferredSize(
//     //   preferredSize: Size.fromHeight(0),
//     //   child: SizedBox(height: 0),
//     // ),
//     // flexibleSpace: const FlexibleSpaceBar(
//     //     titlePadding: EdgeInsets.all(38.0),
//     //     centerTitle: true,
//     //     collapseMode: CollapseMode.pin,
//     //     background: Image(
//     //       height: 533,
//     //       image: AssetImage(AssetConstants.bgAppBar2),
//     //       fit: BoxFit.cover,
//     //     )),
//     title: Container(
//       margin: Platform.isAndroid ? const EdgeInsets.only(top:35.0) : const EdgeInsets.only(top:20.0),
//       child: textAutoSize(context,
//           text: title!,
//           maxLines: 1,
//           color: Theme.of(context).primaryColorLight,
//           textAlign: TextAlign.center,
//           fontWeight: FontWeight.w600,
//           fontSize: 20),
//     ),
//     actions: [
//       Container(
//         margin: Platform.isAndroid ? const EdgeInsets.only(top:25.0) : const EdgeInsets.only(top:20.0),
//         child: hideRightIcon
//             ? Container(width: dp25)
//             : buttonOnlyIcon2(
//                 onPressCallback: () {
//                   // Get.to(() => const NotificationsPage());
//                 },
//             size: 24,
//                 iconPath: AssetConstants.icNotification,iconColor: Theme.of(context).primaryColorLight),
//       ),
//     ],
//   );
// }
// AppBar appBarMainWithFilter(BuildContext context,
//     {String? title}) {
//   return AppBar(
//     backgroundColor: Get.theme.backgroundColor,
//     elevation: 0,
//     centerTitle: true,
//     leading: buttonOnlyIcon(onPressCallback: () {
//       Scaffold.of(context).openDrawer();
//     }, iconPath: AssetConstants.icMenu, size: dp25,iconColor: Get.theme.primaryColorDark),
//     title: textAutoSize(context,text: title!, maxLines: 1,textAlign: TextAlign.center,fontWeight: FontWeight.w600,fontSize: 20),
//     actions: [
//       buttonOnlyIcon2(onPressCallback: () {
//         Get.to(() =>const FilterPage());
//       }, iconPath: AssetConstants.icFilter),
//       buttonOnlyIcon2(onPressCallback: () {
//         Get.to(() =>const NotificationsPage());
//       }, iconPath: AssetConstants.icNotification),
//     ],
//   );
// }

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
        iconPath: AssetConstants.icBack,
        size: Dimens.iconSize,
        iconColor: Get.theme.primaryColorLight),
    title: textAutoSize(context,
        text: title!,
        maxLines: 1,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w600,
        fontSize: 20),
    actions: [
      hideRightIcon
          ? Container(width: dp25)
          : buttonOnlyIcon2(
              onPressCallback: () {
                // Get.to(() => const NotificationsPage());
              },
              iconPath: AssetConstants.icNotification,iconSize: 24),
    ],
  );
}
AppBar buildAppBarFilterWithBack(BuildContext context,
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
        iconPath: AssetConstants.icBack,
        size: Dimens.iconSize,
        iconColor: Get.theme.primaryColorLight),
    title: textAutoSize(context,
        text: title!,
        maxLines: 1,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w600,
        fontSize: 20),
    actions: [
      hideRightIcon
          ? Container(width: dp25)
          : buttonOnlyIcon2(
              onPressCallback: () {
                // Get.to(() => const NotificationsPage());
              },
              iconPath: AssetConstants.icFilterTwo),
    ],
  );
}

// AppBar buildAppBarWithBackAndFilter({String? title}) {
//   return AppBar(
//     backgroundColor: Get.theme.backgroundColor,
//     elevation: 0,
//     centerTitle: true,
//     leading: buttonOnlyIcon2(onPressCallback: () {
//       Get.back();
//     }, iconPath: AssetConstants.icArrowLeft, size: dp22,iconColor: Get.theme.primaryColorDark),
//     title: textAutoSize(context,text: title!, maxLines: 1,textAlign: TextAlign.center,fontWeight: FontWeight.w600,fontSize: 20),
//     actions: [
//       buttonOnlyIcon2(onPressCallback: () {
//         Get.to(() =>const FilterPage());
//       }, iconPath: AssetConstants.icFilter),
//       buttonOnlyIcon2(onPressCallback: () {
//         Get.to(() =>const NotificationsPage());
//       }, iconPath: AssetConstants.icNotification),
//     ],
//   );
// }
//
// Widget buildAppBarWithBack({String? title, bool hideRightIcon = false}) {
//   return Container(
//     padding: EdgeInsets.only(left: dp0, right: dp0),
//     height: kToolbarHeight,
//     child: Row(
//       children: [
//         buttonOnlyIcon2(onPressCallback: () {
//           Get.back();
//         }, iconPath: AssetConstants.ic_arrow_left, size: dp25),
//         Expanded(child: textNormalCenter22(text: title!)),
//         hideRightIcon
//             ? Container(width: dp25)
//             : buttonOnlyIcon2(onPressCallback: () {
//           Get.to(() =>NotificationsPage());
//         }, iconPath: AssetConstants.ic_notification),
//       ],
//     ),
//   );
// }
//
// //
// // bool status = false;
// // Widget appBarMainWithSwitch(BuildContext context, String title,
// //     VoidCallback rightIconAction, String rightIconPath) {
// //   return Container(
// //     padding: EdgeInsets.only(left: dp15, right: dp20),
// //     height: dp80,
// //     child: Row(
// //       children: [
// //         appBarMenuIcon(context),
// //         Expanded(
// //             child:
// //                 textTitleLarge(title, Get.theme.primaryColorDark, maxLines: 1)),
// //         Container(
// //           child: FlutterSwitch(
// //             width: 125.0,
// //             height: 55.0,
// //             valueFontSize: 25.0,
// //             toggleSize: 45.0,
// //             value: status,
// //             borderRadius: 30.0,
// //             padding: 8.0,
// //             showOnOff: true,
// //             onToggle: (val) {
// //               setState(() {
// //                 status = val;
// //               });
// //             },
// //           ),
// //         ),
// //         //getSwitchOnlineOffline(rightIconAction, iconPath: rightIconPath)
// //
// //       ],
// //     ),
// //   );
// // }
//
// Widget appBarProfile(BuildContext context, String title,
//     VoidCallback rightIconAction, String rightIconPath) {
//   return Container(
//     padding: EdgeInsets.only(left: dp15, right: dp20),
//     height: dp80,
//     child: Row(
//       children: [
//         appBarMenuIcon(context),
//         Expanded(child: textNormalCenter22(text: title, maxLines: 1)),
//         rightIconPath.isNotEmpty
//             ? buttonOnlyIcon2(onPressCallback: rightIconAction, iconPath: rightIconPath)
//             : Container(
//           width: dp25,
//         ),
//       ],
//     ),
//   );
// }
//
// Widget appBarWithBack(String title) {
//   return Container(
//     padding: EdgeInsets.only(left: dp15, right: dp20),
//     height: dp80,
//     child: Row(
//       children: [
//         appBarMenuIconBlack(),
//         Expanded(child: textNormalCenter22(text: title, maxLines: 1)),
//         Container(
//           width: dp25,
//         ),
//       ],
//     ),
//   );
// }
//
// Widget appBarWithoutSlideNav(BuildContext context, String title,
//     VoidCallback rightIconAction, String rightIconPath) {
//   return Container(
//     padding: EdgeInsets.only(left: dp15, right: dp20),
//     height: dp80,
//     child: Row(
//       children: [
// /*        Container(
//           height: dp50,
//           width: dp50,
//           padding: EdgeInsets.all(8),
//           decoration: getRoundCornerBoxWhite(),
//           child: buttonOnlyIcon(onPressCallback: () {
//             Scaffold.of(context).openDrawer();
//           }, iconPath: AssetConstants.ic_menu, size: dp25),
//         ),*/
//         Expanded(child: textNormalCenter22(text: title)),
//         rightIconPath.isNotEmpty
//             ? buttonOnlyIcon2(onPressCallback: rightIconAction, iconPath: rightIconPath)
//             : Container(
//           width: dp25,
//         ),
//       ],
//     ),
//   );
// }
//
// Widget buildAppBarLanding(String title, BuildContext context) {
//   return Container(
//     height: dp50,
//     child: Row(
//       children: [
//         buttonOnlyIcon2(onPressCallback: () {
//           Scaffold.of(context).openDrawer();
//         }, iconPath: AssetConstants.ic_menu),
//         Expanded(child: textNormalCenter22(text: title)),
//         buttonOnlyIcon2(onPressCallback: () {
//           //Get.to(() =>NotificationsPage());
//         }, iconPath: AssetConstants.ic_notification),
//       ],
//     ),
//   );
// }
//
// Widget tabBarText(TabController tabController, List<Widget> tabs) {
//   return Container(
//     decoration: decorationBottomBorder(),
//     margin: EdgeInsets.only(left: dp15, right: dp15),
//     child: TabBar(
//       controller: tabController,
//       labelStyle: Get.textTheme.headline3,
//       unselectedLabelStyle: Get.textTheme.subtitle1,
//       indicatorColor: Get.theme.primaryColorDark,
//       tabs: tabs,
//     ),
//   );
// }
//
// Tab tabTextUnderline(String title) {
//   return Tab(
//     child: Container(
//       child: Align(
//         alignment: Alignment.center,
//         child: AutoSizeText(title),
//       ),
//     ),
//   );
// }
