import 'dart:ui';

bool gIsLoggedIn = false;
String gLanguageCode = "";

///Light Theme Colors
const Color kPrimaryColor = Color(0xffffffff);
const Color kBackgroundColor = Color(0xffFAFAFA);
const Color kPrimaryDarkColor = Color(0xff23262F);
const Color kAccentColor = Color(0xff32D777);
const Color kLightGreen = Color(0xffF5FFF9);
const Color kGrayLightColor = Color(0xffF7F7F8);
const Color kMainTextGrayColor = Color(0xff777E90);
const Color kDropdownBtnColor = Color(0xff777778);
const Color kAlterTextColor = Color(0xff23262F);
const Color kLinkTextColor = Color(0xffFF2E2E);
const Color kBorderColor = Color(0xffDDDDDD);
const Color blackColor = Color(0xff000000);
const Color redColor = Color(0xffF31629);
const Color kBlueColor = Color(0xff2F67FF);

const String kDateFormat = 'dd MMMM yyyy';
const String kReceivedDateFormat = 'yyyy-MM-dd HH:mm:ss';

enum IdVerificationType { none, nid, passport, driving }

class AssetConstants {
  static const pathTempImageFolder = "/tmpImages/";
  static const pathTempFrontImageName = "_frontImage_id_verify.jpeg";
  static const pathTempBackImageName = "_backImage_id_verify.jpeg";
  static const pathTempProfileImageName = "_profileImage_id_verify.jpeg";


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

  static const icGoogleAuthenticatorLogo = basePathImages + "icGoogleAuthenticatorLogo.png";
  static const icEmptyDataPng = basePathImages + "icEmptyDataPng.png";

  static const basePathIcons = "assets/icons/";
  static const icLogo = basePathIcons + "icLogo.svg";
  static const icArrowLeft = basePathIcons + "ic_arrow_left.svg";
  static const icArrowRight = basePathIcons + "ic_arrow_right.svg";
  static const icArrowDown = basePathIcons + "ic_arrow_down.svg";
  static const icCloseBox = basePathIcons + "ic_close_box.svg";
  static const icPasswordHide = basePathIcons + "ic_password_hide.svg";
  static const icPasswordShow = basePathIcons + "ic_password_show.svg";
  static const icBoxSquare = basePathIcons + "ic_box_square.svg";
  static const icTickRound = basePathIcons + "ic_tick_round.svg";
  static const icTickSquare = basePathIcons + "ic_tick_square.svg";
  static const icTickLarge = basePathIcons + "icTickLarge.svg";
  static const icTime = basePathIcons + "icTime.svg";
  static const icBoxFilter = basePathIcons + "icBoxFilter.svg";
  static const icCrossIsolated = basePathIcons + "icCrossIsolated.svg";
  static const icAccentDot = basePathIcons + "icAccentDot.svg";
  // static const icDotCircle = basePathIcons + "ic_dot_circle.svg";


  // static const icEmail = basePathIcons + "ic_email.svg";
  // static const icLock = basePathIcons + "ic_lock.svg";
  // static const icGoogle = basePathIcons + "ic_google.svg";
  // static const icFacebook = basePathIcons + "ic_facebook.svg";
  // static const icShare = basePathIcons + "ic_share.svg";
  // static const icCancel = basePathIcons + "ic_cancel.svg";
  static const icCamera = basePathIcons + "ic_camera.svg";

  static const icNotification = basePathIcons + "icNotification.svg";
  static const icMenu = basePathIcons + "icMenu.svg";

  static const icDashboard = basePathIcons + "icDashboard.svg";
  static const icActivity = basePathIcons + "icActivity.svg";
  static const icWallet = basePathIcons + "icWallet.svg";
  static const icMarket = basePathIcons + "icMarket.svg";

  static const icNavActivity = basePathIcons + "icNavActivity.svg";
  static const icNavLogout = basePathIcons + "icNavLogout.svg";
  static const icNavPersonalVerification = basePathIcons + "icNavPersonalVerification.svg";
  static const icNavProfile = basePathIcons + "icNavProfile.svg";
  static const icNavReferrals = basePathIcons + "icNavReferrals.svg";
  static const icNavResetPassword = basePathIcons + "icNavResetPassword.svg";
  static const icNavSecurity = basePathIcons + "icNavSecurity.svg";
  static const icNavSettings = basePathIcons + "icNavSettings.svg";

  static const icHomeTabSelected = basePathIcons + "ic_home_tab_selected.svg";
  static const icExplore = basePathIcons + "ic_explore.svg";
  static const icExploreTabSelected = basePathIcons + "ic_explore_tab_selected.svg";
  static const icFavorite = basePathIcons + "ic_favorite.svg";
  static const icFavoriteTabSelected = basePathIcons + "ic_favorite_tab_selected.svg";
  static const icFavoriteFill = basePathIcons + "ic_favorite_fill.svg";
  static const icCategory = basePathIcons + "ic_category.svg";
  static const icCategoryFill = basePathIcons + "ic_category_fill.svg";
  static const icCategoryTabSelected = basePathIcons + "ic_category_tab_selected.svg";
  static const icStatus = basePathIcons + "ic_status.svg";
  static const icStatusTabSelected = basePathIcons + "ic_status_tab_selected.svg";

  static const icOption = basePathIcons + "icOption.svg";
  static const icFilter = basePathIcons + "icFilter.svg";
  static const icFilterTwo = basePathIcons + "icFilterTwo.svg";
  static const icFavoriteStar = basePathIcons + "icFavoriteStar.svg";
  static const icEmptyData = basePathIcons + "icEmptyData.svg";
  static const icBack = basePathIcons + "icBack.svg";
  static const icSearch = basePathIcons + "icSearch.svg";
  static const icCoinLogo = basePathIcons + "icCoinLogo.svg";


}

class FromKey {
  static const activity = "activity";
  static const ranking = "ranking";
  static const buy = "buy";
  static const sell = "sell";
  static const openOrders = "Open orders";
  static const orderHistory = "Order History";
  static const tradeHistory = "Trade History";
  static const funds = "funds";
  static const orderBook = "Order book";
  static const trade = "trade";
  static const info = "info";
  static const overview = "overview";
  static const withdraw = "withdraw";
  static const deposit = "deposit";
  static const swap = "swap";
}

class PrefKeyConstant {
  static const String kAccessToken = 'access_token';
  static const String kTokenType = 'token_type';
  static const String kIsDark = 'is_dark';
  static const String kIsNotification = 'is_notification';
  static const String kLanguage = 'language';
  static const String kCurrency = 'currency';
  static const String kCountry = 'country';
  static const String kTimeFormat = 'time_format';
  static const String kUserMap = 'user_map';
  static const String kGeneralSettings = 'general_settings';
  static const String kSearchHistory = 'search_history';
  static const String kBookmarkData = 'bookmark_data';
  static const String kIsOnBoardingDone = 'is_on_boarding_done';
  static const String kIsLoggedIn = 'is_logged_in';

  static const isLoggedIn = "is_logged_in";
  // static const isOnBoardingShow = "is_on_boarding_show";
  static const accessToken = "access_token";
  static const refreshToken = "refresh_token";
  static const expireAt = "expire_at";
  static const userObject = "user_object";
  static const generalSettings = "settings_general";
  static const lightMode = "light_mode";
  static const darkMode = "dark_mode";
  static const languageKey = "language_key";
  static const searchHistory = "search_history";
}

class ValueConstants {
  // static const String vTypeTag = 'tags';
  // static const String vTypeCategories = 'categories';
  // static const String vTypeNew = 'new_news';
  // static const String vTypeTop = 'top_news';
  // static const int vPerPageMin = 10;
  // static const int vPerPageComment = 5;
  // static const int vPerPageMid = 20;
  // static const int vPerPageMax = 40;
  // static const int vCodeLength = 6;
  // static const String vRegistration = 'registration';
  // static const String vForgotPassword = 'forgotPassword';
  // static const String vTokenType = 'Bearer ';
  static const String vLanguageCode = 'en';
  static const String vLanguage = 'English';
}

class DefaultValue {
  static const int kPasswordLength = 8;
  static const int codeLength = 6;
  static const int listLimitLarge = 20;
  static const int listLimitMedium = 10;
  static const int listLimitShort = 5;
  static const String country= "Bangladesh";
  static const String languageKey = "en";
  static const String any = "Any";
  static const String anywhere = "Anywhere";
  static const String walletDefault = "DEFAULT";
  static const String imagePathChecker = "/kyc/default.jpeg";
  static const String randomImage = "https://picsum.photos/200";
  static const String longString = "Expandable widgets are often used within a scroll view. "
      "When the user expands a widget, be it an ExpandablePanel or an Expandable with a custom control,"
      " they expect the expanded widget to fit within the viewable area (if possible). "
      "For example, if you show a list of articles with a summary of each article, "
      "and the user expands an article to read it, they expect the expanded article to "
      "occupy as much screen space as possible. The Expandable package contains a widget to "
      "help implement this behavior, ScrollOnExpand. Here's how to use it.";
}

class ArrayConstants {
  static const kCategoryColorList = [
    Color(0xff1F78FC),
    Color(0xffE30261),
    Color(0xffD200A4),
    Color(0xffFFA800),
    kAccentColor,
    kMainTextGrayColor
  ];
  // static const kCategoryIcon = [
  //   AssetConstants.ic_business,
  //   AssetConstants.ic_sports,
  //   AssetConstants.ic_fashion,
  //   AssetConstants.ic_lifeStyle
  // ];
  static const kLanguageMap = {'English': "en", 'Bengali': "bn", 'Spanish': "es", 'Arabic': "ar"};
  static const kCurrency = ['USD', 'BDT', 'RS', 'EU'];
  static const kCountry = ['United State', 'Bangladesh', 'Portugal', 'Saudi Arabia'];
  static const kTimeFormat = ['GMT', 'UTC'];
}

class IdVerificationStatus {
  static const notSubmitted = "Not submitted";
  static const pending = "Pending";
  static const accepted = "Approved";
  static const rejected = "Rejected";
}

class UserStatus {
  static const pending = 0;
  static const accepted = 1;
  static const rejected = 2;
  static const suspended = 4;
  static const deleted = 5;
}

class OfferType {
  static const buy = "buy";
  static const sell = "sell";
}

class APIConstants {
  static const baseUrl = "https://tradexpro-exchange.itech-theme.com";

  //End Urls
  static const urlSignIn = "/api/sign-in";
  static const urlSignUp = "/api/sign-up";
  static const urlVerifyEmail = "/api/verify-email";
  static const urlForgotPassword = "/api/forgot-password";
  static const urlResetPassword = "/api/reset-password";
  static const urlChangePassword = "/api/change-password";
  static const urlResendEmailVerificationCode = "/api/resend-email-verification-code";
  static const urlMyProfile = "/api/profile-view";
  static const urlProfileEdit = "/api/profile-edit";
  static const urlUpdateProfile = "/api/save-edited-profile";
  static const urlIdVerification = "/api/id-verification";
  static const urlSubmitIdVerificationPhoto = "/api/submit-verification-images";

  //Key
  static const kUserName = "username";
  static const kPassword = "password";
  static const kAccessToken = "accessToken";
  static const kRefreshToken = "refreshToken";
  static const kExpireAt = "expireAt";
  static const kPhone = "phone";
  static const kEmail = "email";
  static const kName = "name";
  static const kTitle = "title";
  static const kStatus = "status";
  static const kImage = "image";
  static const kId = "id";
  static const kUpdatedAt = "updatedAt";
  static const kCreatedAt = "createdAt";
  static const kAvatar = "avatar";
  static const kIsEmailVerified = "isEmailVerified";
  static const kWalletAddress = "walletAddress";

  static const kFirst = "first";
  static const kPaginateNumber = "paginateNumber";

  static const vBearer = "bearer ";

  //response parameter
  static const kConfirmPassword = "password_confirmation";
  static const kCurrentPassword = "current_password";
  static const kCountry = "country";
  static const kVerificationType = "verification_type";
  static const kFrontImage = "front_image";
  static const kBackImage = "back_image";

  static const kAccept = "Accept";
  static const kAuthorization = "Authorization";
  static const kPage = "page";
  static const kLimit = "limit";
  static const kType = "type";
  static const kLanguage = "lang";
  static const kCode = "code";
  static const kCount = "count";
  static const kUrl = "url";
  static const kRemove = "remove";
  static const kGoogle2factSecret = "google2fa_secret";
  static const kNotificationId = "notification_id";
  static const kG2faVerify = "g2f_verify";
  static const kWalletName = "wallet_name";
  static const kWalletDetails = "wallet_details";
  static const kCoinId = "coin_id";
  static const kWalletId = "wallet_id";
  static const kAddress = "address";
  static const kAmount = "amount";
  static const kMessage = "message";
  static const kReceiverId = "receiver_id";
  static const kWithdraws = "withdraws";
  static const kDeposits = "deposites";
  static const kOfferId = "offer_id";
  static const kOfferType = "offer_type";
  static const kOrderType = "order_type";
  static const kOrderId = "order_id";
  static const kPaymentMethod = "payment_method";
  static const kPaymentId = "payment_id";
  static const kCoinType = "coin_type";
  static const kPriceType = "price_type";
  static const kRatePercentage = "rate_percentage";
  static const kCoinRate = "coin_rate";
  static const kPrice = "price";
  static const kTextMessage = "text_message";
  static const kReason = "reason";
  static const kAttachFile = "attach_file";
  static const kPaymentSlip = "payment_sleep";

  static const vAccept = "application/json";
  static const kProfilePhotoPath = "";
}

class SocketConstants {
  //static const baseUrl = "ws://192.168.68.138:6005/app/test";
  //static const baseUrl = "wss://p2p-api.itech-theme.com/app/test";
  static const baseUrl = "wss://p2p-api.cdibrandstudio.com/app/test";
  static const channelNotification = "usernotification_";
  static const channelOrderMessage = "userordermessage_";
}

class URLConstants {
  static const fbReferral = "https://www.facebook.com/sharer/sharer.php?u=";
  static const twitterReferral = "https://www.twitter.com/share?url=";
}

// Regular Expression
const String kRegExpEmail = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const String kRegExpPhone = "(\\+[0-9]+[\\- \\.]*)?(\\([0-9]+\\)[\\- \\.]*)?" + "([0-9][0-9\\- \\.]+[0-9])";
const String patternMail =
    r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$";

class ListConstants {
  static const List<String> transactionType = ["Buy", "Sell"];
  static const List<String> coinType = ["BTC", "LTCT", "ETH", "LTC", "DOGE", "BCH", "DASH", "ETC", "USDT"];
  static const List<String> registrationType = ["email", "phone"];
  static const List<String> paymentType = ['Bank', 'Card', 'Coin'];
  static const List<String> rateType = ['Dynamic Rate', 'Static Rate'];
  static const List<String> dynamicRateType = ['Above', 'Below'];
  static const List<String> stopLimitList = ['Stop-limit', 'limit', 'market', 'OCO'];
  static const List<String> cryptoList = ['BTC/USDT', 'Eth', 'XOR', 'OCO'];
  static const List<String> currencyList = ['USD', 'EURO', 'INR', 'BDT'];
  static const List<String> profileDropdownMenuList = ['Profile', 'Referrals', 'Security', 'Sessions & login history', '2FA', 'Change password'];
  static const List<String> tagItems = ['Post only', 'iceberg'];
  static const List<String> decimalPointList = ['0.01', '0.1', '1', '10', '50', '100'];
  static const List<String> countryList = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "American Samoa",
    "Andorra",
    "Angola",
    "Anguilla",
    "Antarctica",
    "Antigua and/or Barbuda",
    "Argentina",
    "Armenia",
    "Aruba",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bermuda",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Bouvet Island",
    "Brazil",
    "British Indian Ocean Territory",
    "Brunei Darussalam",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Cape Verde",
    "Cayman Islands",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Christmas Island",
    "Cocos (Keeling) Islands",
    "Colombia",
    "Comoros",
    "Congo",
    "Cook Islands",
    "Costa Rica",
    "Croatia (Hrvatska)",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "East Timor",
    "Ecudaor",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Ethiopia",
    "Falkland Islands (Malvinas)",
    "Faroe Islands",
    "Fiji",
    "Finland",
    "France",
    "France, Metropolitan",
    "French Guiana",
    "French Polynesia",
    "French Southern Territories",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Gibraltar",
    "Greece",
    "Greenland",
    "Grenada",
    "Guadeloupe",
    "Guam",
    "Guatemala",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Heard and Mc Donald Islands",
    "Honduras",
    "Hong Kong",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran (Islamic Republic of)",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Ivory Coast",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Korea, Democratic People's Republic of",
    "Korea, Republic of",
    "Kosovo",
    "Kuwait",
    "Kyrgyzstan",
    "Lao People's Democratic Republic",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libyan Arab Jamahiriya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Macau",
    "Macedonia",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Martinique",
    "Mauritania",
    "Mauritius",
    "Mayotte",
    "Mexico",
    "Micronesia, Federated States of",
    "Moldova, Republic of",
    "Monaco",
    "Mongolia",
    "Montserrat",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "Netherlands Antilles",
    "New Caledonia",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "Niue",
    "Norfork Island",
    "Northern Mariana Islands",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Pitcairn",
    "Poland",
    "Portugal",
    "Puerto Rico",
    "Qatar",
    "Reunion",
    "Romania",
    "Russian Federation",
    "Rwanda",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Georgia South Sandwich Islands",
    "South Sudan",
    "Spain",
    "Sri Lanka",
    "St. Helena",
    "St. Pierre and Miquelon",
    "Sudan",
    "Suriname",
    "Svalbarn and Jan Mayen Islands",
    "Swaziland",
    "Sweden",
    "Switzerland",
    "Syrian Arab Republic",
    "Taiwan",
    "Tajikistan",
    "Tanzania, United Republic of",
    "Thailand",
    "Togo",
    "Tokelau",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Turks and Caicos Islands",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States",
    "United States minor outlying islands",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Vatican City State",
    "Venezuela",
    "Vietnam",
    "Virigan Islands (British)",
    "Virgin Islands (U.S.)",
    "Wallis and Futuna Islands",
    "Western Sahara",
    "Yemen",
    "Yugoslavia",
    "Zaire",
    "Zambia",
    "Zimbabwe"
  ];
}

class ErrorConstants {
  static const unauthorized = "Unauthorized";
}

const htmlTextDemo = """
<h1>Header 1</h1>
<h3>Ruby Support:</h3>
      <p>
        <ruby>
          漢<rt>かん</rt>
          字<rt>じ</rt>
        </ruby>
        &nbsp;is Japanese Kanji.
      </p>
      <h3>Support for <code>sub</code>/<code>sup</code></h3>
      Solve for <var>x<sub>n</sub></var>: log<sub>2</sub>(<var>x</var><sup>2</sup>+<var>n</var>) = 9<sup>3</sup>
      <p>One of the most <span>common</span> equations in all of physics is <br /><var>E</var>=<var>m</var><var>c</var><sup>2</sup>.</p>
      <h3>Inline Styles:</h3>
      <p>The should be <span style='color: blue;'>BLUE style='color: blue;'</span></p>
      <p>The should be <span style='color: red;'>RED style='color: red;'</span></p>
      <p>The should be <span style='color: rgba(0, 0, 0, 0.10);'>BLACK with 10% alpha style='color: rgba(0, 0, 0, 0.10);</span></p>
      <p>The should be <span style='color: rgb(0, 97, 0);'>GREEN style='color: rgb(0, 97, 0);</span></p>
      <p>The should be <span style='background-color: red; color: rgb(0, 97, 0);'>GREEN style='color: rgb(0, 97, 0);</span></p>
      <p style="text-align: center;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <p style="text-align: right;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <p style="text-align: justify;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <p style="text-align: center;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <h3>Table support (with custom styling!):</h3>
      <p>
      <q>Famous quote...</q>
      </p>
      <table>
      <colgroup>
        <col width="50%" />
        <col span="2" width="25%" />
      </colgroup>
      <thead>
      <tr><th>One</th><th>Two</th><th>Three</th></tr>
      </thead>
      <tbody>
      <tr>
        <td rowspan='2'>Rowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan</td><td>Data</td><td>Data</td>
      </tr>
      <tr>
        <td colspan="2"><img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' /></td>
      </tr>
      </tbody>
      <tfoot>
      <tr><td>fData</td><td>fData</td><td>fData</td></tr>
      </tfoot>
      </table>
      <h3>Custom Element Support (inline: <bird></bird> and as block):</h3>
      <flutter></flutter>
      <flutter horizontal></flutter>
      <h3>SVG support:</h3>
      <svg id='svg1' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>
            <circle r="32" cx="35" cy="65" fill="#F00" opacity="0.5"/>
            <circle r="32" cx="65" cy="65" fill="#0F0" opacity="0.5"/>
            <circle r="32" cx="50" cy="35" fill="#00F" opacity="0.5"/>
      </svg>
      <h3>List support:</h3>
      <ol>
            <li>This</li>
            <li><p>is</p></li>
            <li>an</li>
            <li>
            ordered
            <ul>
            <li>With<br /><br />...</li>
            <li>a</li>
            <li>nested</li>
            <li>unordered
            <ol>
            <li>With a nested</li>
            <li>ordered list.</li>
            </ol>
            </li>
            <li>list</li>
            </ul>
            </li>
            <li>list! Lorem ipsum dolor sit amet.</li>
            <li><h2>Header 2</h2></li>
            <h2><li>Header 2</li></h2>
      </ol>
      <h3>Link support:</h3>
      <p>
        Linking to <a href='https://github.com'>websites</a> has never been easier.
      </p>
      <h3>Image support:</h3>
      <h3>Network png</h3>
      <img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' />
      <h3>Network svg</h3>
      <img src='https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/android.svg' />
      <h3>Local asset png</h3>
      <img src='asset:assets/html5.png' width='100' />
      <h3>Local asset svg</h3>
      <img src='asset:assets/mac.svg' width='100' />
      <h3>Base64</h3>
      <img alt='Red dot' src='data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==' />
      <h3>Custom source matcher (relative paths)</h3>
      <img src='/wikipedia/commons/thumb/e/ef/Octicons-logo-github.svg/200px-Octicons-logo-github.svg.png' />
      <h3>Custom image render (flutter.dev)</h3>
      <img src='https://flutter.dev/images/flutter-mono-81x100.png' />
      <h3>No image source</h3>
      <img alt='No source' />
      <img alt='Empty source' src='' />
      <h3>Broken network image</h3>
      <img alt='Broken image' src='https://www.notgoogle.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' />
""";
