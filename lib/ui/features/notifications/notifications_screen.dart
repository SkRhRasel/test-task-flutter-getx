import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:test_task_flutter_getx/utils/button_util.dart';
import 'package:test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:test_task_flutter_getx/utils/widgets.dart';
import 'notifications_controller.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final _controller = Get.put(NotificationsController());

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: buildAppBarWithBack(context,
            title: "Notifications".tr, hideRightIcon: true),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: _notificationGroupedList(),
        )));
  }

  Widget _notificationGroupedList() {
    return Expanded(
      child: GroupedListView<dynamic, String>(
        padding: EdgeInsets.zero,
        elements: _controller.notificationItemList,
        groupBy: (element) => element['group'],
        groupSeparatorBuilder: (String groupByValue) =>
            _notificationSection(groupByValue),
        itemBuilder: (context, dynamic element) => notificationItem(),
        order: GroupedListOrder.DESC, // optional
      ),
    );
  }

  Widget _notificationSection(String title) {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 0),
      height: 50,
      child: Row(
        children: [
          Expanded(child: textAutoSize(text: title)),
          buttonText("Clear all".tr, () {}, fontSize: 14)
        ],
      ),
    );
  }
}
