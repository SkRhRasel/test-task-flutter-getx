import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCategoriesController extends GetxController {
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

  bool hasMoreData = true;
  int loadedPage = 0;
  bool isDataLoaded = false;


  RxString selectedType = "".obs;
  TextEditingController? searchController;


  List<int>? activityTypeList = <int>[1,2,3].obs;
  bool isLoading = true;


}
