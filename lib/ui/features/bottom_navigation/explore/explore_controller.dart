import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_flutter_getx/data/models/imageList.dart';

class ExploreController extends GetxController with GetSingleTickerProviderStateMixin {
TabController? walletTabController;

TextEditingController? searchController;


RxList<ImageList> imageList = <ImageList>[].obs;

List<int>? assetBalancesList = <int>[1,2,3,4,5,6].obs;
bool isLoading = true;
int loadedPage = 0;
bool hasMoreData = true;


RxString selectedCurrencyType = "".obs;


@override
void onInit() {
  walletTabController = TabController(vsync: this, length: 4);
  super.onInit();
}

  Future<void> getData() async {
    // todayAuctionList.value = <Auction>[];
    // categoryList.value = <Category>[];
    // featuredList.value = <Auction>[];
    // getTodayAuctions();
    // getFeaturedItems();
    //getCategories();
    // categoryList.value = <Category>[];
    // getCategories();
    // getCategoryList(false);
  }

  void clearView() {
    //
  }




}