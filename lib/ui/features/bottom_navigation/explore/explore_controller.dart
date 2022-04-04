import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_flutter_getx/data/models/list_response.dart';
import 'package:test_task_flutter_getx/data/remote/api_repository.dart';
import 'package:test_task_flutter_getx/utils/common_utils.dart';

class ExploreController extends GetxController with GetSingleTickerProviderStateMixin {
TabController? walletTabController;

TextEditingController? searchController;


List<int> demoList = <int>[1,2,3,4,5,6,7,8,9].obs;
RxList<Product> productList = <Product>[].obs;


int loadedItem = 0;
bool hasMoreData = true;
bool isDataLoaded = false;
bool isLoading = true;

void getAllImageList(bool isFromLoadMore) {
  if (!isFromLoadMore) {
    loadedItem = 0;
    hasMoreData = true;
    productList.clear();
    isLoading = false;
  }
  isLoading = true;
  loadedItem++;
  APIRepository().getProductList(loadedItem).then((resp) {
  // APIRepository().getProductList().then((resp) {
    isLoading = false;
    if (resp.products !=null) {
      try {
        productList.addAll(resp.products!);
      } catch (e) {
        printError();
      }
      loadedItem = resp.limit ?? 0;
      hasMoreData = resp.total != null;
    }
  }, onError: (err) {
    isLoading = false;
    showToast(err.toString());
  });
}


  Future<void> getData() async {
    // getAllProductList();
  }

  void clearView() {
    //
  }




}