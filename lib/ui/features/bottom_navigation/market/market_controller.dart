import 'package:get/get.dart';
class FavoriteItemsController extends GetxController{


  List<int> marketBannerList = <int>[1,2,3,4,5,6].obs;

  RxString selectedCurrencyType = "".obs;
  List<int>? marketCoinBuySellList = <int>[1,2,3].obs;
  bool isLoading = true;

  Future<void> getData() async {
    // todayAuctionList.value = <Auction>[];
    // categoryList.value = <Category>[];
    // featuredList.value = <Auction>[];
    // getTodayAuctions();
    // getFeaturedItems();
    //getCategories();
  }

  void clearView() {
    //
  }

  bool hasMoreData = true;
  int loadedPage = 0;
  bool isDataLoaded = false;


}