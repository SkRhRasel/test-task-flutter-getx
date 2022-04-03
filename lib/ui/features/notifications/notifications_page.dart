import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:test_task_flutter_getx/utils/button_util.dart';
import 'package:test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:test_task_flutter_getx/utils/dimens.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:test_task_flutter_getx/utils/widgets.dart';
import 'notifications_controller.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final _controller = Get.put(NotificationsController());

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      //_controller.getNotificationItems();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: buildAppBarWithBack(context, title: "Notifications".tr, hideRightIcon: true),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: dp15),
              child: _notificationGroupedList(),
            )));
  }

//
// Widget _notificationList() {
//   return Obx(() {
//     String message = "empty_message_notifications_list".tr;
//     return _controller.notificationList.isEmpty
//         ? handleEmptyViewWithLoading(_controller.isDataLoaded,
//         message: message)
//         : SizedBox(
//             //height: Get.height - (Get.bottomBarHeight + Get.statusBarHeight + dp 100),
//             height: Get.height,
//             child: ListView.builder(
//               padding: EdgeInsets.zero,
//               scrollDirection: Axis.vertical,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: _controller.notificationList.length,
//               itemBuilder: (BuildContext context, int index) {
//                 // if (_controller.hasMoreData &&
//                 //     index == (_controller.notificationList.length - 1)) {
//                 //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
//                 //     _controller.getNotificationItems(false);
//                 //   });
//                 // }
//
//                 return notificationItem(_controller.notificationList[index]);
//               },
//             ),
//           );
//   });
// }

  Widget _notificationGroupedList() {
    // return Obx(() {
    //   return _controller.notificationItemList!.length == 0
    //       ? Container()
    //       :
    return Expanded(
      child: GroupedListView<dynamic, String>(
        padding: EdgeInsets.zero,
        elements: _controller.notificationItemList,
        groupBy: (element) => element['group'],
        groupSeparatorBuilder: (String groupByValue) => _notificationSection(groupByValue),
        itemBuilder: (context, dynamic element) => notificationItem(),
        order: GroupedListOrder.DESC, // optional
      ),
    );
    //});
  }

  // Widget _notificationSection(String title) {
  //   return Container(
  //     height: dp30,
  //     alignment: Alignment.center,
  //     child: Row(
  //       children: [
  //         Expanded(child: textAutoSizeNormal16(text: title)),
  //         buttonText("Clear all".tr, () {}, fontSize: dp14)
  //       ],
  //     ),
  //   );
  // }

  Widget _notificationSection(String title) {
    return Container(
      margin: const EdgeInsets.only(left: dp0, right: dp0),
      height: dp50,
      child: Row(
        children: [
          Expanded(child: textAutoSizeNormal16(text: title)),
          buttonText("Clear all".tr, () {}, fontSize: dp14)
        ],
      ),
    );
  }
}
