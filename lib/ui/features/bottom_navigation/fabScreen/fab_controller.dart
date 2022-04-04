import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FabController extends GetxController with GetTickerProviderStateMixin {
  TabController? tabController;
  TabController? tabControllerOpenOrderFunds;


  TextEditingController editController = TextEditingController();


  RxInt selectedTagItem = 0.obs;

  RxString selectedDecimalPoint = "".obs;
  RxString selectedStopLimit = "".obs;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    tabControllerOpenOrderFunds = TabController(vsync: this, length: 2);
    super.onInit();
  }

  Future<void> getData() async {
    // todayAuctionList.value = <Auction>[];
    // categoryList.value = <Category>[];
    // featuredList.value = <Auction>[];
    // getTodayAuctions();
    // getFeaturedItems();
  }

  void clearView() {
    //
  }


}