import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_task_flutter_getx/ui/features/bottom_navigation/explore/explore_screen.dart';
import 'package:test_task_flutter_getx/ui/features/bottom_navigation/home/home_screen.dart';
import 'package:test_task_flutter_getx/ui/features/bottom_navigation/inbox/inbox_screen.dart';
import 'package:test_task_flutter_getx/ui/features/bottom_navigation/shop/shop_screen.dart';
import '../../../data/local/constants.dart';
import '../../../utils/button_util.dart';
import '../../../utils/common_utils.dart';
import '../../../utils/decorations.dart';
import '../../../utils/dimens.dart';
import '../../../utils/image_util.dart';
import '../../../utils/text_util.dart';
import '../ui/features/bottom_navigation/fabScreen/fab_screen.dart';
import 'root_controller.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  final RootController _controller = Get.put(RootController());

  @override
  void dispose() {
    hideKeyboard(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: SafeArea(
        child: _getBody(),
      ),
      bottomNavigationBar: getBottomNavigationBar(),
      drawer: _getDrawer(context),
    );
  }

  /// Returns color of the selected item
  Color? _getItemColor(int index) {
    return _controller.selectedIndex.value == index
        ? Get.theme.colorScheme.secondary
        : kNavButtonInactive;
  }

  void _onItemTapped(int index) {
    setState(() {
      _controller.selectedIndex.value = index;
    });
  }

  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Get.theme.primaryColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon:
              SvgPicture.asset(AssetConstants.icHome, color: _getItemColor(0)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetConstants.icExplore,
              color: _getItemColor(1)),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetConstants.icPlus,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon:
              SvgPicture.asset(AssetConstants.icInbox, color: _getItemColor(3)),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon:
              SvgPicture.asset(AssetConstants.icShop, color: _getItemColor(4)),
          label: 'Shop',
        ),
      ],
      currentIndex: _controller.selectedIndex.value,
      onTap: _onItemTapped,
    );
  }

  Widget _getBody() {
    switch (_controller.selectedIndex.value) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ExploreScreen();
      case 2:
        return const FabScreen();
      case 3:
        return const InboxScreen();
      case 4:
        return const ShopScreen();
      default:
        return Container();
    }
  }

  _getDrawer(context) {
    return Theme(
      data: Get.theme.copyWith(
        canvasColor: Get.theme.backgroundColor,
      ),
      child: SizedBox(
        width: Get.width / 1.2,
        child: Drawer(
          elevation: 0,
          child: Column(
            children: [
              SizedBox(
                height: 270,
                width: MediaQuery.of(context).size.width,
                child: DrawerHeader(
                  decoration: getRoundCornerWithShadow(),
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: Dimens.gapMid),
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        dense: true,
                        visualDensity: const VisualDensity(vertical: -4),
                        onTap: () {
                          Get.back();
                        },
                        leading: buttonOnlyIcon(
                            iconPath: AssetConstants.icCloseBox,
                            size: 20,
                            iconColor: Get.theme.primaryColorDark),
                      ),
                      CircleAvatar(
                        foregroundColor: Colors.blue,
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: ClipOval(
                          child: imageViewNetwork(
                              imagePath: 'https://picsum.photos/200',
                              height: 108),
                        ),
                      ),
                      textAutoSize(
                          width: Get.width,
                          text: 'Sk Rockybul Hasan Rasel'.tr,
                          fontSize: Dimens.buttonFontSize,
                          textAlign: TextAlign.center),
                      textAutoSize(
                          width: Get.width,
                          text: 'sk.rasel.cse@gmail.com'.tr,
                          fontSize: Dimens.regularFontSizeExtraMid,
                          textAlign: TextAlign.center),
                      textAutoSize(
                          width: Get.width,
                          text: 'Flutter Developer'.tr,
                          fontSize: Dimens.regularFontSizeExtraMid,
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerNavMenuItem(
      {required String navTitle,
      required String iconPath,
      VoidCallback? navAction}) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 35),
      leading: imageView(
          imagePath: iconPath,
          iconSize: 22,
          color: Get.theme.primaryColorLight),
      title: textAutoSize(text: navTitle, color: Get.theme.primaryColorLight),
      onTap: navAction,
    );
  }

  BottomNavigationBarItem setNavigationItem(
      String iconPath, String iconPathSelected) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          iconPath,
          height: 24,
        ),
        activeIcon: SvgPicture.asset(
          iconPathSelected,
          height: 44,
        ),
        label: "");
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
