import 'dart:ui';

bool gIsLoggedIn = false;
String gLanguageCode = "";

///Light Theme Colors
const Color kPrimaryColor = Color(0xffffffff);
const Color kBackgroundColor = Color(0xffFAFAFA);
const Color kPrimaryDarkColor = Color(0xff040415);
const Color kAccentColor = Color(0xffF15223);
const Color kLightGreen = Color(0xffF5FFF9);
const Color kGrayLightColor = Color(0xffF7F7F8);
const Color kMainTextGrayColor = Color(0xff94929B);
const Color kDropdownBtnColor = Color(0xff777778);
const Color kAlterTextColor = Color(0xff23262F);
const Color kLinkTextColor = Color(0xffFF2E2E);
const Color kFollowBgColor = Color(0xffFEF6F4);
const Color kBorderColor = Color(0xffF2F2F3);
const Color blackColor = Color(0xff000000);
const Color redColor = Color(0xffF31629);
const Color kBlueColor = Color(0xff2F67FF);
const Color kGreenColor = Color(0xff3DDC84);
const Color kButtonBg = Color(0xffF4F5F7);
const Color kNavButtonInactive = Color(0xffA19FA8);

class AssetConstants {
  static const basePathImages = "assets/images/";
  static const avatar = basePathImages + "avatar.png";
  static const noImage = basePathImages + "noImage.png";
  static const imgNotAvailable = basePathImages + "imageNotAvailable.png";
  static const bgSplash = basePathImages + "bgSplash.png";
  static const bgScreen = basePathImages + "bgScreen.png";
  static const bgAuth = basePathImages + "bgAuth.png";
  static const bgAuthTop = basePathImages + "bgAuthTop.png";
  static const bgAuthMiddle = basePathImages + "bgAuthMiddle.png";
  static const bgAuthBottomLeft = basePathImages + "bgAuthBottomLeft.png";
  static const bgAppBar = basePathImages + "bgAppBar.png";
  static const bgAppBar2 = basePathImages + "bgAppBar2.png";
  static const bg = basePathImages + "bg.png";
  static const bg2 = basePathImages + "bg2.png";
  static const bgNavHeader = basePathImages + "bgNavHeader.png";
  static const qr = basePathImages + "qr.png";
  static const btcChart = basePathImages + "btcChart.png";
  static const learn = basePathImages + "learn.png";

  static const bgOnBoarding = basePathImages + "bgOnBoarding.png";
  static const onBoarding0 = basePathImages + "onBoarding0.png";
  static const onBoarding1 = basePathImages + "onBoarding1.png";
  static const onBoarding2 = basePathImages + "onBoarding2.png";

  static const icGoogleAuthenticatorLogo =
      basePathImages + "icGoogleAuthenticatorLogo.png";
  static const icEmptyDataPng = basePathImages + "icEmptyDataPng.png";

  static const basePathIcons = "assets/icons/";
  static const icLogo = basePathIcons + "icLogo.png";
  static const icArrowLeft = basePathIcons + "ic_arrow_left.svg";
  static const icCloseBox = basePathIcons + "ic_close_box.svg";
  static const icCamera = basePathIcons + "ic_camera.svg";

  static const icNotification = basePathIcons + "icNotification.svg";
  static const icMenu = basePathIcons + "icMenu.svg";

  static const icHome = basePathIcons + "icHome.svg";
  static const icExplore = basePathIcons + "icExplore.svg";
  static const icInbox = basePathIcons + "icInbox.svg";
  static const icShop = basePathIcons + "icShop.svg";
  static const plus = basePathIcons + "plus.svg";
  static const icPlus = basePathIcons + "icPlus.svg";

  static const icBack = basePathIcons + "icBack.svg";
  static const icSearch = basePathIcons + "icSearch.svg";
  static const icAddUser = basePathIcons + "icAddUser.svg";
  static const icImage = basePathIcons + "icImage.svg";
}

class PrefKeyConstant {
  static const String kIsOnBoardingDone = 'is_on_boarding_done';
}

class DefaultValue {
  static const int listLimitLarge = 20;
  static const int listLimitMedium = 10;
  static const int listLimitShort = 5;
  static const String longString =
      "Expandable widgets are often used within a scroll view. "
      "When the user expands a widget, be it an ExpandablePanel or an Expandable with a custom control,"
      " they expect the expanded widget to fit within the viewable area (if possible). "
      "For example, if you show a list of articles with a summary of each article, "
      "and the user expands an article to read it, they expect the expanded article to "
      "occupy as much screen space as possible. The Expandable package contains a widget to "
      "help implement this behavior, ScrollOnExpand. Here's how to use it.";
}

class APIConstants {
  static const baseUrl =
      "https://mocki.io/v1/02e91d9f-4d8c-4eb4-a4f9-bb4a60ffdaf9";

  //Key

  //response parameter
  static const products = "products";
  static const kTotal = "total";
  static const kSkip = "skip";
  static const kLimit = "limit";
}

class ListConstants {
  static const List<String> bottomNavTitle = [
    'Home',
    'Explore',
    'Inbox',
    'Shop'
  ];
}
