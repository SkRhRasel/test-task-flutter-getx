import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_task_flutter_getx/data/local/constants.dart';
import 'package:test_task_flutter_getx/utils/common_utils.dart';
import 'package:test_task_flutter_getx/utils/custom_appbar.dart';
import 'package:test_task_flutter_getx/utils/decorations.dart';
import 'package:test_task_flutter_getx/utils/dimens.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:test_task_flutter_getx/utils/widgets.dart';

import 'search_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = Get.put(SearchController());

  @override
  void initState() {
    super.initState();
    _controller.searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        body: SafeArea(
            child: Column(children: [
          buildAppBarWithBack(context, title: "Search".tr, hideRightIcon: true),
          _buildSearchBox(),
          Obx(() {
            return Expanded(
                child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: _controller.hasSearchList.value
                  ? _searchedItemList()
                  : _buildRecentSearchView(),
            ));
          })
        ])));
  }

  Widget _buildSearchBox() {
    return Container();
  }

  Widget _buildRecentSearchView() {
    return Obx(() {
      return _controller.historyList.isEmpty
          ? Container()
          : Column(
              children: [
                textAutoSizeBold15(text: "Recent search".tr, width: Get.width),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        _controller.historyList.length,
                        (index) =>
                            _buildHistoryItem(_controller.historyList[index]))),
                // VSpacer10(),
                // Column(crossAxisAlignment: CrossAxisAlignment.start,
                //     children: List.generate(_controller.recommendedItemList.length+1,
                //         (index) => index == 0 ? textTitleMid("Recommendation".tr) : featuredItemView(null)))
              ],
            );
    });
  }

  Widget _buildHistoryItem(String text) {
    return ListTile(
      title: textAutoSizeBold16(
        text: text,
      ),
      trailing: InkWell(
        onTap: () {
        },
        child: SvgPicture.asset(
          AssetConstants.icCloseBox,
        ),
      ),
      dense: true,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      onTap: () {
      },
    );
  }

  Widget _searchedItemList() {
    return Obx(() {
      String message = "empty_message_all_categories_list".tr;
      return _controller.searchedItemList.isEmpty
          ? handleEmptyViewWithLoading(_controller.isDataLoaded,
              message: message)
          : Container();
    });
  }
}
