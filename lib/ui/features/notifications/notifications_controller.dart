import 'package:get/get.dart';

class NotificationsController extends GetxController {
  List<int>? notificationList = <int>[1,2,3,4,5,6,7,8,9].obs;

  List<dynamic> notificationItemList = [
    {'name': 'John', 'group': 'April 27, 2022'},
    {'name': 'Will', 'group': 'April 27, 2022'},
    {'name': 'Beth', 'group': 'April 27, 2022'},
    {'name': 'Miranda', 'group': 'April 26, 2022'},
    {'name': 'Mike', 'group': 'April 26, 2022'},
    {'name': 'Danny', 'group': 'April 26, 2022'},
    {'name': 'Simul', 'group': 'April 2, 2022'},
    {'name': 'Danny2', 'group': 'April 2, 2022'},
    {'name': 'Danny3', 'group': 'April 2, 2022'},
    {'name': 'Danny4', 'group': 'April 2, 2022'},
  ].obs;

  //RxList<NotificationResponse> notificationList = <NotificationResponse>[].obs;
  //RxList<AppNotificationResponse> notificationList = <AppNotificationResponse>[].obs;

  //bool isLoadingNotification = false;
  bool isDataLoaded = false;
  int loadedPage = 0;
  bool hasMoreData = true;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // Future<void> getData() async {
  //   notificationList.value = <AppNotificationResponse>[];
  //   getNotificationItems();
  //   //getNotificationItems(true);
  // }

  //void getNotificationItems(bool isFromLoadMore) {
  // void getNotificationItems() {
  //   // if (!isFromLoadMore) {
  //   //   loadedPage = 0;
  //   //   hasMoreData = true;
  //   //   notificationList.clear();
  //   //   isDataLoaded = false;
  //   // }
  //
  //   isDataLoaded = true;
  //   //showLoadingDialog();
  //   //APIRepository().getNotificationItems(1).then((resp) {
  //   APIRepository().getNotificationItems().then((resp) {
  //     isDataLoaded = false;
  //     //hideLoadingDialog();
  //     if (resp.success) {
  //
  //       var list = List<AppNotificationResponse>.from(resp.data.map((x) => AppNotificationResponse.fromJson(x)));
  //       notificationList.addAll(list);
  //       // AppNotificationResponse appNotificationListResponse = AppNotificationResponse.fromJson(resp.data);
  //       // if (appNotificationListResponse != null) {
  //       //   isDataLoaded = true;
  //       //   //loadedPage = listResponse.data.currentPage;
  //       //   notificationList.addAll(appNotificationListResponse);
  //       //   //hasMoreData = listResponse.auctionLists.nextPageUrl != null;
  //       // }
  //     } else {
  //       showToast(resp.message);
  //     }
  //   }, onError: (err) {
  //     showToast(err.toString());
  //   });
  // }
}
