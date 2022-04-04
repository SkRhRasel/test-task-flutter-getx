import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_flutter_getx/data/models/imageList.dart';
import 'package:test_task_flutter_getx/data/models/list_response.dart';
import 'package:test_task_flutter_getx/data/remote/api_repository.dart';
import 'package:test_task_flutter_getx/utils/common_utils.dart';

class ExploreController extends GetxController with GetSingleTickerProviderStateMixin {
TabController? walletTabController;

TextEditingController? searchController;


List<int> demoList = <int>[1,2,3,4,5,6,7,8,9].obs;
RxList<Product> productList = <Product>[].obs;

int loadedPage = 0;
bool hasMoreData = true;
bool isDataLoaded = false;
bool isLoading = false;

// void getAllImageList(bool isFromLoadMore) {
void getAllProductList() {
  // if (!isFromLoadMore) {
  //   loadedPage = 0;
  //   hasMoreData = true;
  //   imageList.clear();
  //   isLoading = false;
  // }
  // isLoading = true;
  // loadedPage++;
  // APIRepository().getImageList(loadedPage).then((resp) {
  APIRepository().getProductList().then((resp) {
    isLoading = false;
    if (resp.products !=null) {
      // ListResponse response = ListResponse.fromJson(resp!.products);

      try {
        // List<Product> list = List<Product>.from(resp.products!.map((x) => Product.fromJson(x)));
        productList.addAll(resp.products!);
      } catch (e) {
        printError();
      }
      // loadedPage = response.currentPage ?? 0;
      // hasMoreData = response.nextPageUrl != null;
    }
    // else {
    //   showToast(resp.message,isError: true);
    // }
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