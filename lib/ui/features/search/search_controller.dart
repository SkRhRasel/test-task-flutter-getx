import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_task_flutter_getx/utils/common_utils.dart';

import '../../../data/models/category.dart';

class SearchController extends GetxController {
  TextEditingController? searchController;
  RxList<Category> searchedItemList = <Category>[].obs;
  List<int> recommendedItemList = <int>[1, 2, 3].obs;
  RxList<String> historyList = <String>[].obs;
  RxBool hasSearchList = false.obs;
  RxBool isGetSavedSearchList = false.obs;
  int loadedPage = 0;
  bool hasMoreData = true;

  bool isDataLoaded = false;

}
