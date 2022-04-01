import 'dart:io' show Platform;
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery_test_task_flutter_getx/ui/features/bottom_navigation/activity/activity_screen.dart';
import 'package:gallery_test_task_flutter_getx/ui/features/bottom_navigation/dashboard/dashboard_screen.dart';
import 'package:gallery_test_task_flutter_getx/ui/features/bottom_navigation/market/market_screen.dart';
import 'package:gallery_test_task_flutter_getx/ui/features/bottom_navigation/wallet/wallet_screen.dart';
import 'package:get/get.dart';
import '../../../data/local/constants.dart';
import '../../../utils/button_util.dart';
import '../../../utils/common_utils.dart';
import '../../../utils/decorations.dart';
import '../../../utils/dimens.dart';
import '../../../utils/image_util.dart';
import '../../../utils/spacers.dart';
import '../../../utils/text_util.dart';
import 'custom_icon_icons.dart';
import 'root_controller.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  final RootController _controller = Get.put(RootController());
  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of a first screen
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  final iconList = <IconData>[
    CustomIcons.icdashboard,
    CustomIcons.wallet,
    CustomIcons.icmarket,
    CustomIcons.icactivity,
  ];

  @override
  void initState() {
    super.initState();
    // _controller.setMyProfile();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      //
    });

    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      const Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    hideKeyboard(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        body: _getBody(),
        drawer: _getDrawer(context),
        // drawerEdgeDragWidth: MediaQuery.of(context).size.width,
        floatingActionButton: ScaleTransition(
          scale: animation,
          child: FloatingActionButton(
            child: const Icon(
              Icons.add,
              size: 40,
            ),
            backgroundColor: Theme.of(context).focusColor,
            onPressed: () {
              _animationController.reset();
              _animationController.forward();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final iconColor = isActive
                ? Theme.of(context).primaryColor
                : Theme.of(context).focusColor;
            final bgColor = isActive
                ? Theme.of(context).focusColor
                : Theme.of(context).primaryColor;
            return Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: bgColor,
                // border: Border.all(color: Theme.of(context).colorScheme.secondary.withOpacity(0.9), width: 1,),
              ),
              child: Icon(
                iconList[index],
                size: 20,
                color: iconColor,
              ),
            );
          },
          activeIndex: _bottomNavIndex,
          backgroundColor: Theme.of(context).primaryColor,
          splashColor: HexColor('#FFA400'),
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 300,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.sharpEdge,
          leftCornerRadius: Dimens.borderRadiusLarge,
          rightCornerRadius: Dimens.borderRadiusLarge,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          // onTap: _controller.onItemTapped,
          // onTap: onItemTapped,
        )
        // bottomNavigationBar: Obx(() {
        //   return getBottomNavigationBar();
        // }),
        );
  }

  // void onItemTapped(int index) {
  //   setState(() {
  //     _controller.selectedIndex.value = index;
  //   });
  // }

  Widget _getBody() {
    switch (_bottomNavIndex) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const WalletScreen();
      case 2:
        return const MarketScreen();
      case 3:
        return const ActivityScreen();
      // case 4:
      //   return const StatusPage();
      default:
        return Container();
    }
  }

  _getDrawer(context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).backgroundColor,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Drawer(
          elevation: 0,
          child: Column(
            children: [
              SizedBox(
                // height: MediaQuery.of(context).size.height/2.8,
                height: 270,
                width: MediaQuery.of(context).size.width,
                child: DrawerHeader(
                  decoration: bgNavDrawer,
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      SizedBox(
                          height: Platform.isAndroid
                              ? Dimens.gapExtraDoubleLarge
                              : Dimens.gapLarge),
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        dense: true,
                        visualDensity: const VisualDensity(vertical: -4),
                        onTap: () {
                          Get.back();
                        },
                        leading: buttonOnlyIcon(
                            iconPath: AssetConstants.icCloseBox,
                            size: dp20,
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
                      textAutoSize(context,
                          width: Get.width,
                          text: 'Geoffrey Chaucer'.tr,
                          fontSize: Dimens.buttonFontSize,
                          textAlign: TextAlign.center),
                      textAutoSize(context,
                          width: Get.width,
                          text: 'geoffreychaucer78@gmail.com',
                          fontSize: Dimens.regularFontSizeExtraMid,
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
              // Obx(() {
              //   return _profileView(_controller.userRx.value);
              // }),
              _loggedInMenuView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget sideNavProfileView({double bottomPadding = 0}) {
    return Container(
      decoration: getRoundCornerWithShadow(),
      margin: const EdgeInsets.only(
          left: dp10, right: dp40, bottom: dp10, top: dp15),
      child: InkWell(
        onTap: () {
          // Get.to(() => const MyProfilePage());
        },
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: Get.width,
                    decoration: getRoundCornerBorderOnlyTop(
                        bgColor: Get.theme.primaryColor),
                    child: imageView(imagePath: AssetConstants.avatar)),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: imageView(
                      imagePath: AssetConstants.icCamera,
                      iconSize: 50,
                      onPressCallback: () {
                        // showImageChooser(context, (chooseFile, isGallery) {
                        //   if (isGallery) {
                        //     //_controller.profileImage.value = chooseFile;
                        //   } else {
                        //     saveFileOnTempPath(chooseFile);
                        //   }
                        // });
                      }),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              decoration: getRoundCornerBorderOnlyBottom(),
              padding: const EdgeInsets.only(
                  left: dp10, top: dp10, right: dp5, bottom: dp10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VSpacer5(),
                  textAutoSize(context,
                      width: Get.width,
                      text: 'Welcome!'.tr,
                      fontSize: dp12,
                      textAlign: TextAlign.center),
                  textAutoSize(context,
                      width: Get.width,
                      text: 'User full Name',
                      fontSize: dp16,
                      textAlign: TextAlign.center),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _loggedInMenuView() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          // shrinkWrap: true,
          children: [
            textAutoSizePoppins(context,text: 'Profile'),
            // drawerNavMenuItem(
            //     navTitle: 'Profile'.tr,
            //     iconPath: AssetConstants.icNavProfile,
            //     navAction: () {
            //       Get.to(() => const ProfileScreen());
            //     }),
            // drawerNavMenuItem(
            //     navTitle: 'Security'.tr,
            //     iconPath: AssetConstants.icNavSecurity,
            //     navAction: () {
            //       Get.to(() => const SettingsScreen());
            //     }),
            // drawerNavMenuItem(
            //     navTitle: 'Personal Verification'.tr,
            //     iconPath: AssetConstants.icNavPersonalVerification,
            //     navAction: () {
            //       Get.to(() => const ProfileScreen());
            //     }),
            // drawerNavMenuItem(
            //     navTitle: 'Referrals'.tr,
            //     iconPath: AssetConstants.icNavReferrals,
            //     navAction: () {
            //       Get.to(() => const ReferralsScreen());
            //     }),
            // drawerNavMenuItem(
            //     navTitle: 'Reset Password'.tr,
            //     iconPath: AssetConstants.icNavResetPassword,
            //     navAction: () {
            //       Get.to(() => const ResetPasswordScreen());
            //     }),
            // drawerNavMenuItem(
            //     navTitle: 'Activity'.tr,
            //     iconPath: AssetConstants.icNavActivity,
            //     navAction: () {
            //       Get.back();
            //       setState(() => _bottomNavIndex = 3);
            //     }),
            // drawerNavMenuItem(
            //     navTitle: 'Settings'.tr,
            //     iconPath: AssetConstants.icNavSettings,
            //     navAction: () {
            //       Get.to(() => const SettingsScreen());
            //     }),
            // drawerNavMenuItem(
            //     navTitle: 'Log out'.tr,
            //     iconPath: AssetConstants.icNavLogout,
            //     navAction: () {
            //       //Get.to(() => const SettingsScreen());
            //     }),
          ],
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
          color: Theme.of(context).primaryColorLight),
      title: textAutoSize(context,
          text: navTitle, color: Theme.of(context).primaryColorLight),
      onTap: navAction,
    );
  }

  Widget _loggedInMenuView2() {
    return Container(
      padding: const EdgeInsets.only(top: dp5, bottom: dp5),
      // child: Column(
      //   children: [
      //     const Divider(),
      //     listTitleWithArrow(
      //         title: "My Profile".tr,
      //         iconPath: AssetConstants.icArrowRight,
      //         action: () {
      //           Get.to(() => const MyProfilePage(
      //               //myUser: _controller.myUser.value,
      //               ));
      //         }),
      //     const Divider(),
      //     listTitleWithArrow(
      //         title: "My Collection".tr,
      //         iconPath: AssetConstants.icArrowRight,
      //         action: () {
      //           Get.to(() => const MyCollectionsPage(
      //               //myUser: _controller.myUser.value,
      //               ));
      //         }),
      //     const Divider(),
      //     listTitleWithArrow(
      //         title: "Won Items".tr,
      //         iconPath: AssetConstants.icArrowRight,
      //         action: () {
      //           Get.to(() => const WonItemsPage(
      //               //myUser: _controller.myUser.value,
      //               ));
      //         }),
      //     const Divider(),
      //     listTitleWithArrow(
      //         title: "Add Wallet".tr,
      //         iconPath: AssetConstants.icArrowRight,
      //         action: () {
      //           Get.to(() => const AddWalletPage(
      //               //myUser: _controller.myUser.value,
      //               ));
      //         }),
      //     const Divider(),
      //     listTitleWithArrow(
      //         title: "Settings".tr,
      //         iconPath: AssetConstants.icArrowRight,
      //         action: () {
      //           Get.to(() => const SettingsPage(
      //               //myUser: _controller.myUser.value,
      //               ));
      //         }),
      //     const Divider(),
      //     listTitleWithArrow(
      //         title: "Help Center".tr,
      //         iconPath: AssetConstants.icArrowRight,
      //         action: () {
      //           Get.to(() => const HelpCenterPage(
      //               //myUser: _controller.myUser.value,
      //               ));
      //         }),
      //     const Divider(),
      //     listTitleWithArrow(
      //         title: "Log Out".tr,
      //         iconPath: AssetConstants.icLogout,
      //         action: () {
      //           Get.off(() => const SignInPage());
      //           //_controller.logOut();
      //         }),
      //     const Divider(),
      //   ],
      // ),
    );
  }

  void alertForLogOut(VoidCallback okAction) {
    Get.defaultDialog(
      title: "",
      radius: dp10,
      backgroundColor: Get.theme.primaryColorDark,
      content: SizedBox(
        height: dp150,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            textAutoSize(context,
                text: "Log out".tr, textAlign: TextAlign.center),
            const VSpacer10(),
            textAutoSize(context,
                text: "Are you really want to log out?".tr,
                maxLines: 2,
                textAlign: TextAlign.center,
                fontSize: dp12),
            const VSpacer10(),
            buttonRoundedFill("Yes".tr, okAction, width: Get.width / 2)
          ],
        ),
      ),
    );
  }

  // Widget _singUpMenuView() {
  //   return Container(
  //     padding: EdgeInsets.only(top: dp5, bottom: dp5),
  //     child: Column(
  //       children: [
  //         listTitleWithLeftIcon(
  //             "Home".tr, AssetConstants.ic_home_color, kThemeTextColor, () {
  //           Get.back();
  //         }),
  //         listTitleWithArrow("Settings".tr, AssetConstants.ic_arrow_right, () {
  //           Get.to(() => SettingsPage(user: _controller.userRx.value));
  //         }),
  //         listTitleWithArrow("FAQ".tr, AssetConstants.ic_arrow_right, () {
  //           openUrlInBrowser("https://en.wikipedia.org/wiki");
  //         }),
  //       ],
  //     ),
  //   );

  // Widget getBottomNavigationBar() {
  //   return BottomNavigationBar(
  //     //elevation: 5.0,
  //     //type: BottomNavigationBarType.fixed,
  //     backgroundColor: Get.theme.primaryColorLight,
  //     items: <BottomNavigationBarItem>[
  //       setNavigationItem(
  //           AssetConstants.icHome, AssetConstants.icHomeTabSelected),
  //       setNavigationItem(
  //           AssetConstants.icExplore, AssetConstants.icExploreTabSelected),
  //       setNavigationItem(
  //           AssetConstants.icFavorite, AssetConstants.icFavoriteTabSelected),
  //       setNavigationItem(
  //           AssetConstants.icCategory, AssetConstants.icCategoryTabSelected),
  //       setNavigationItem(
  //           AssetConstants.icStatus, AssetConstants.icStatusTabSelected),
  //     ],
  //     currentIndex: _controller.selectedIndex.value,
  //     onTap: _controller.onItemTapped,
  //   );
  // }

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
