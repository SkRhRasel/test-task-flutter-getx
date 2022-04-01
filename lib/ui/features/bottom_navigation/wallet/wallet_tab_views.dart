// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tradexpro_flutter/data/local/constants.dart';
// import 'package:tradexpro_flutter/ui/features/bottom_navigation/dashboard/cross_isolated/CrossIsolatedController.dart';
// import 'package:tradexpro_flutter/ui/features/bottom_navigation/wallet/wallet_controller.dart';
// import 'package:tradexpro_flutter/utils/button_util.dart';
// import 'package:tradexpro_flutter/utils/decorations.dart';
// import 'package:tradexpro_flutter/utils/dimens.dart';
// import 'package:tradexpro_flutter/utils/image_util.dart';
// import 'package:tradexpro_flutter/utils/text_field_util.dart';
// import 'package:tradexpro_flutter/utils/text_util.dart';
// import 'package:tradexpro_flutter/utils/widgets.dart';
//
// class WalletTabViews extends StatefulWidget {
//   final String? fromPage;
//
//   const WalletTabViews({Key? key, this.fromPage}) : super(key: key);
//
//   @override
//   _WalletTabViewsState createState() => _WalletTabViewsState();
// }
//
// class _WalletTabViewsState extends State<WalletTabViews> {
//   final _controller = Get.put(WalletController());
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
//       // widget.fromPage == FromKey.activity
//       //     ? _controller.getFeaturedItems(false)
//       //     : _controller.getScheduleItems(false);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: widget.fromPage == FromKey.overview
//             ? overviewTabView()
//             : widget.fromPage == FromKey.withdraw
//                 ? withdrawTabView()
//                 : widget.fromPage == FromKey.deposit
//                     ? depositTabView()
//                     : swapTabView());
//   }
//
//   Widget overviewTabView() {
//     return ListView(
//       shrinkWrap: true,
//       children: [
//         const SizedBox(height: Dimens.gapMin),
//         Container(
//           decoration: getShadowWithRadius(),
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               textAutoSizeDMSans(context, fontSize: 24, text: 'Overview'.tr),
//               const SizedBox(height: Dimens.gapMin),
//               textFieldWithSuffixIcon(context,
//                   labelText: 'Search'.tr,
//                   controller: _controller.searchController,
//                   hint: "Search".tr,
//                   type: TextInputType.text,
//                   iconPath: AssetConstants.icSearch,
//                   borderRadius: Dimens.borderRadiusLarge),
//               // buildSearchBox(), // with search page
//               const SizedBox(height: Dimens.gapMin),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Obx(() {
//                       return dropDownListMain(
//                           context,
//                           // _controller.getLanguageList(),
//                           ListConstants.currencyList,
//                           _controller.selectedCurrencyType.value,
//                           "USD".tr, (value) {
//                         _controller.selectedCurrencyType.value = value;
//                       });
//                     }),
//                   ),
//                   const SizedBox(width: Dimens.gapSmallMid),
//                   Expanded(
//                     flex: 3,
//                     child: buttonRoundedMain(
//                         text: 'Show Balance'.tr,
//                         borderRadius: Dimens.borderRadiusLarge),
//                   ),
//                   const SizedBox(width: Dimens.gapMid),
//                 ],
//               ),
//               const SizedBox(height: Dimens.gapMin),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   textAutoSizeDMSans(context,
//                       fontSize: 14, text: 'Total balance'.tr),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       textAutoSizeDMSans(context,
//                           fontSize: 24, text: '0.27894652'.tr),
//                       const SizedBox(width: Dimens.gapMin),
//                       buttonRoundedAccent(context,
//                           text: 'BTC', width: 60, buttonHeight: 26)
//                     ],
//                   ),
//                   textAutoSizePoppins(context,
//                       fontSize: 14, text: '\$10,098.36'.tr),
//                 ],
//               )
//             ],
//           ),
//         ),
//         const SizedBox(height: Dimens.gapMin),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: textAutoSizePoppins(context,
//               fontSize: 14,
//               text: 'Asset Balances'.tr,
//               textAlign: TextAlign.start),
//         ),
//         const SizedBox(height: Dimens.gapMin),
//         Container(
//           decoration: getShadowWithRadius(),
//           // padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               Container(
//                 decoration: decorationBottomBorder(),
//                 padding: const EdgeInsets.all(16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     textAutoSizeDMSans(context, fontSize: 14, text: 'Asset'.tr),
//                     textAutoSizeDMSans(context,
//                         fontSize: 14, text: 'Total balance'.tr)
//                   ],
//                 ),
//               ),
//               const SizedBox(height: Dimens.gapMin),
//               // assetBalanceItem(),
//               _assetBalanceList(_controller.assetBalancesList),
//               const SizedBox(height: Dimens.gapMid),
//               buttonLoadMore(context, action: () {
//               }),
//               const SizedBox(height: Dimens.gapMid),
//             ],
//
//           ),
//         ),
//         const SizedBox(height: Dimens.gapMid),
//       ],
//     );
//   }
//
//   Widget _assetBalanceList(list) {
//     return list.isEmpty
//         ? handleEmptyViewWithLoading(context, _controller.isLoading)
//         : Column(
//             children: List.generate(
//               list.length,
//               (index) => assetBalanceItem(_controller.assetBalancesList),
//               // (index) => assetBalanceItem(_controller.assetBalancesList[index]),
//             ),
//           );
//   }
//
//   Widget assetBalanceItem(assetBalancesList) {
//     return Container(
//       // decoration: decorationRoundCornerBox(color: Get.theme.primaryColor),
//       // alignment: Alignment.center,
//       margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//       // height: dp100,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Expanded(
//             flex: 1,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 imageView(imagePath: AssetConstants.icCoinLogo),
//                 const SizedBox(width: Dimens.gapMin),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     textAutoSizeDMSans(context, text: 'BTC'.tr),
//                     textAutoSizePoppins(context,
//                         text: 'Bitcoin'.tr, fontSize: 14),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 textAutoSizeDMSans(context, text: '0.2785689852 BTC'.tr),
//                 textAutoSizePoppins(context,
//                     text: '\$10,098.36'.tr, fontSize: 14),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSearchBox() {
//     return Container(
//         margin:
//             const EdgeInsets.only(left: 16, top: dp10, right: 16, bottom: dp10),
//         height: kToolbarHeight,
//         child: TextField(
//           controller: _controller.searchController,
//           textInputAction: TextInputAction.search,
//           decoration: decorationSearchBox(rightIconAction: () {
//             _controller.getSearchData(false);
//           }),
//           onSubmitted: (value) {
//             _controller.getSearchData(false);
//           },
//         ));
//   }
//
//   Widget withdrawTabView() {
//     return Container(
//       width: Get.width,
//       color: Theme.of(context).primaryColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           imageView(
//               imagePath: AssetConstants.icEmptyDataPng,
//               color: Theme.of(context).primaryColorLight,
//               height: 80),
//           textAutoSizeLabelSmallSubtitle(context,
//               text: 'You have no order history'.tr)
//         ],
//       ),
//     );
//   }
//
//   Widget depositTabView() {
//     return Container(
//       width: Get.width,
//       color: Theme.of(context).primaryColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           imageView(
//               imagePath: AssetConstants.icEmptyDataPng,
//               color: Theme.of(context).primaryColorLight,
//               height: 80),
//           textAutoSizeLabelSmallSubtitle(context,
//               text: 'You have no trade history'.tr)
//         ],
//       ),
//     );
//   }
//
//   Widget swapTabView() {
//     return Container(
//       width: Get.width,
//       color: Theme.of(context).primaryColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           imageView(
//               imagePath: AssetConstants.icEmptyDataPng,
//               color: Theme.of(context).primaryColorLight,
//               height: 80),
//           textAutoSizeLabelSmallSubtitle(context,
//               text: 'You have no trade swap'.tr)
//         ],
//       ),
//     );
//   }
//
// // Widget _activityList() {
// //   return Obx(() {
// //     String message = "empty_message_activity_status_list".tr;
// //     return _controller.categoryList.isEmpty
// //         ? handleEmptyViewWithLoading(_controller.isDataLoaded,
// //             message: message)
// //         : ListView.builder(
// //             scrollDirection: Axis.vertical,
// //             itemCount: _controller.categoryList.length,
// //             itemBuilder: (BuildContext context, int index) {
// //               // if (_controller.hasMoreData && index == (_controller.categoryList.length - 1)) {
// //               //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
// //               //     _controller.categoryList(true);
// //               //   });
// //               // }
// //               //return liveAuctionItemViewDemo(_controller.categoryList[index], bottomPadding: dp10);
// //               return statusTabActivityItemView(
// //                   _controller.categoryList[index]);
// //             },
// //           );
// //   });
// // }
// //
// // Widget _rankingList() {
// //   return Obx(() {
// //     String message = "empty_message_ranking_status_list".tr;
// //     return _controller.categoryList.isEmpty
// //         ? handleEmptyViewWithLoading(_controller.isDataLoaded,
// //             message: message)
// //         : ListView.builder(
// //             scrollDirection: Axis.vertical,
// //             itemCount: _controller.categoryList.length,
// //             itemBuilder: (BuildContext context, int index) {
// //               // if (_controller.hasMoreData && index == (_controller.categoryList.length - 1)) {
// //               //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
// //               //     _controller.categoryList(true);
// //               //   });
// //               // }
// //               //return liveAuctionItemViewDemo(_controller.categoryList[index], bottomPadding: dp10);
// //               return statusTabRankingItemView(
// //                   _controller.categoryList[index]);
// //             },
// //           );
// //   });
// // }
// //
// // String subTitle = 'More';
// //
// // Widget statusTabActivityItemView(Category category,
// //     {bool isFavorite = false}) {
// //   return Container(
// //     decoration: getRoundCornerWithShadow(),
// //     alignment: Alignment.center,
// //     margin: const EdgeInsets.symmetric(horizontal: dp15, vertical: dp5),
// //     child: ClipRRect(
// //       borderRadius: const BorderRadius.all(Radius.circular(dp7)),
// //       child: ExpansionTile(
// //         expandedCrossAxisAlignment: CrossAxisAlignment.center,
// //         onExpansionChanged: (expanded) =>
// //             setState(() => subTitle = expanded ? 'Less' : 'More'),
// //         childrenPadding: const EdgeInsets.all(14),
// //         backgroundColor: Get.theme.primaryColorLight,
// //         collapsedIconColor: Get.theme.primaryColorLight,
// //         leading: Container(
// //           width: 50,
// //           height: 45,
// //           decoration: decorationRoundCornerBox(color: themeItemBg2),
// //           child: ClipRRect(
// //             borderRadius: const BorderRadius.all(Radius.circular(dp7)),
// //             //child: getImage110(auction.productImageUrl, false),
// //             child: category.image.isEmpty
// //                 ? imageView(
// //                     imagePath: AssetConstants.imgNotAvailable,
// //                     boxFit: BoxFit.cover)
// //                 : imageViewNetwork(
// //                     imagePath: category.image, boxFit: BoxFit.cover),
// //           ),
// //         ),
// //         title: textAutoSizeBold16(text: "Creative Art collection"),
// //         subtitle: textAutoSizeNormal12(text: subTitle),
// //         trailing: Column(
// //           crossAxisAlignment: CrossAxisAlignment.end,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             textAutoSizeNormal12(text: "Last 2 days"),
// //             const VSpacer5(),
// //             textAutoSizeBold12(text: "Sale"),
// //           ],
// //         ),
// //         children: <Widget>[
// //           horizontalDivider(),
// //           const VSpacer10(),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               Expanded(
// //                 flex: 1,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     textAutoSizeNormal12(text: "Price"),
// //                     const VSpacer5(),
// //                     textAutoSizeNormal12(text: "2.81 ETH"),
// //                   ],
// //                 ),
// //               ),
// //               Expanded(
// //                 flex: 1,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     textAutoSizeNormal12(text: "From".tr),
// //                     const VSpacer5(),
// //                     textAutoSizeNormal12(
// //                         text: "ayoub fenni",
// //                         color: Get.theme.colorScheme.secondary),
// //                   ],
// //                 ),
// //               ),
// //               Expanded(
// //                 flex: 1,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     textAutoSizeNormal12(text: "To".tr),
// //                     const VSpacer5(),
// //                     textAutoSizeNormal12(
// //                         text: "ayoub fenni",
// //                         color: Get.theme.colorScheme.secondary),
// //                   ],
// //                 ),
// //               ),
// //               Expanded(
// //                 flex: 1,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.end,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     textAutoSizeNormal12(text: "Quantity".tr),
// //                     const VSpacer5(),
// //                     textAutoSizeNormal12(text: "1"),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     ),
// //   );
// // }
// //
// // Widget statusTabRankingItemView(Category category,
// //     {bool isFavorite = false}) {
// //   return Container(
// //     decoration: getRoundCornerWithShadow(),
// //     alignment: Alignment.center,
// //     margin: const EdgeInsets.symmetric(horizontal: dp15, vertical: dp5),
// //     child: ClipRRect(
// //       borderRadius: const BorderRadius.all(Radius.circular(dp7)),
// //       child: ExpansionTile(
// //         expandedCrossAxisAlignment: CrossAxisAlignment.center,
// //         onExpansionChanged: (expanded) =>
// //             setState(() => subTitle = expanded ? 'Less' : 'More'),
// //         childrenPadding: const EdgeInsets.all(14),
// //         backgroundColor: Get.theme.primaryColorLight,
// //         collapsedIconColor: Get.theme.primaryColorLight,
// //         leading: Container(
// //           width: 50,
// //           height: 45,
// //           decoration: decorationRoundCornerBox(color: themeItemBg2),
// //           child: ClipRRect(
// //             borderRadius: const BorderRadius.all(Radius.circular(dp7)),
// //             //child: getImage110(auction.productImageUrl, false),
// //             child: category.image.isEmpty
// //                 ? imageView(
// //                     imagePath: AssetConstants.imgNotAvailable,
// //                     boxFit: BoxFit.cover)
// //                 : imageViewNetwork(
// //                     imagePath: category.image, boxFit: BoxFit.cover),
// //           ),
// //         ),
// //         title: textAutoSizeBold16(text: "Creative Art collection"),
// //         subtitle: textAutoSizeNormal12(text: subTitle),
// //         trailing: Column(
// //           crossAxisAlignment: CrossAxisAlignment.end,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             textAutoSizeNormal12(text: "2398.45"),
// //             const VSpacer5(),
// //             textAutoSizeNormal12(
// //                 text: "-12.5", color: Get.theme.colorScheme.secondary),
// //           ],
// //         ),
// //         children: <Widget>[
// //           horizontalDivider(),
// //           const VSpacer10(),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               Expanded(
// //                 flex: 1,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     textAutoSizeNormal12(text: "24h %"),
// //                     const VSpacer5(),
// //                     textAutoSizeNormal12(text: "+3456%", color: themeGreen),
// //                   ],
// //                 ),
// //               ),
// //               Expanded(
// //                 flex: 1,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     textAutoSizeNormal12(text: "Volume".tr),
// //                     const VSpacer5(),
// //                     textAutoSizeNormal12(text: "12,4353"),
// //                   ],
// //                 ),
// //               ),
// //               Expanded(
// //                 flex: 1,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     textAutoSizeNormal12(text: "Owners".tr),
// //                     const VSpacer5(),
// //                     textAutoSizeNormal12(text: "16.3k"),
// //                   ],
// //                 ),
// //               ),
// //               Expanded(
// //                 flex: 1,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.end,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     textAutoSizeNormal12(text: "Assets".tr),
// //                     const VSpacer5(),
// //                     textAutoSizeNormal12(text: "14k"),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     ),
// //   );
// // }
// }
