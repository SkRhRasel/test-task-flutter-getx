// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../local/constants.dart';
// import '../models/response.dart';
// import 'api_provider.dart';
//
// class APIRepository {
//   //final provider = Get.find<APIProvider>();
//   final provider = Get.put(APIProvider());
//
//   //final socketProvider = Get.find<SocketProvider>();
//
//   Map<String, String> authHeader() {
//     String? token = GetStorage().read(PrefKeyConstant.accessToken);
//     //var mapObj = new Map<String, String>();
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kAccept] = APIConstants.vAccept;
//     if (token != null && token.isNotEmpty) {
//       mapObj[APIConstants.kAuthorization] = "${APIConstants.vBearer} $token";
//     }
//     //GetUtils.printFunction("authHeader", mapObj[APIConstants.kAuthorization], "kAuthorization");
//     return mapObj;
//   }
//
//   /// *** POST requests *** ///
//
//   Future<ServerResponse> loginUser(String email, String password) async {
//     var mapObj = {}; //new Map();
//     mapObj[APIConstants.kEmail] = email;
//     mapObj[APIConstants.kPassword] = password;
//     return provider.postRequest(APIConstants.urlLogin, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> registerUser(String firstName, String lastName,
//       String email, String password, String confirmPassword) async {
//     var mapObj = {}; //new Map();
//     mapObj[APIConstants.kFirstName] = firstName;
//     mapObj[APIConstants.kLastName] = lastName;
//     mapObj[APIConstants.kEmail] = email;
//     mapObj[APIConstants.kPassword] = password;
//     mapObj[APIConstants.kConfirmPassword] = confirmPassword;
//     return provider.postRequest(APIConstants.urlSignUp, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> resendVerificationCode(String email) async {
//     var mapObj = new Map();
//     mapObj[APIConstants.kEmail] = email;
//     return provider.postRequest(
//         APIConstants.urlResendVerificationCode, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> verifyEmail(String email, String code) async {
//     //var mapObj = new Map();
//     var mapObj = {};
//     mapObj[APIConstants.kEmail] = email;
//     mapObj[APIConstants.kAccessCode] = code;
//     return provider.postRequest(
//         APIConstants.urlEmailVerify, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> forgetPassword(String email) async {
//     var mapObj = {}; //new Map();
//     mapObj[APIConstants.kEmail] = email;
//     return provider.postRequest(
//         APIConstants.urlForgotPassword, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> resetPassword(String email, String code,
//       String password, String confirmPassword) async {
//     var mapObj = new Map();
//     mapObj[APIConstants.kEmail] = email;
//     mapObj[APIConstants.kCode] = code;
//     mapObj[APIConstants.kPassword] = password;
//     mapObj[APIConstants.kConfirmPassword] = confirmPassword;
//     return provider.postRequest(
//         APIConstants.urlResetPassword, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> updateProfile(User user, File imageFile) async {
//     var mapObj = <String, dynamic>{};
//     mapObj[APIConstants.kFirstName] = user.firstName;
//     mapObj[APIConstants.kLastName] = user.lastName;
//     mapObj[APIConstants.kPhone] = user.phone;
//     mapObj[APIConstants.kCountry] = user.country;
//     mapObj[APIConstants.kGender] = user.gender;
//
//     if (imageFile.path.isNotEmpty) {
//       mapObj[APIConstants.kPhoto] = await makeMultipartFile(imageFile);
//     }
//     return provider.postRequestFormData(
//         APIConstants.urlUpdateProfile, mapObj, authHeader());
//   }
//
//   Future<MultipartFile> makeMultipartFile(File file) async {
//     List<int>? arrayData = await file.readAsBytes();
//     MultipartFile multipartFile = MultipartFile(arrayData, filename: file.path);
//     return multipartFile;
//   }
//
//   Future<ServerResponse> uploadIdVerificationPhotos(
//       IdVerificationType type, File frontFile, File backFile) async {
//     var mapObj = <String, dynamic>{};
//     if (frontFile.path.isNotEmpty) {
//       mapObj[APIConstants.kFrontImage] = await makeMultipartFile(frontFile);
//     }
//     if (backFile.path.isNotEmpty) {
//       mapObj[APIConstants.kBackImage] = await makeMultipartFile(backFile);
//     }
//     String _path = APIConstants.urlSubmitNidPhoto;
//     if (type == IdVerificationType.passport) {
//       _path = APIConstants.urlSubmitPassportPhoto;
//     } else if (type == IdVerificationType.driving) {
//       _path = APIConstants.urlSubmitDrivingLicensePhoto;
//     }
//     return provider.postRequestFormData(_path, mapObj, authHeader());
//   }
//
//   // Future<ServerResponse> uploadDocuments(File selfie, File nidPic, String nidNumber) async {
//   //   var mapObj = new Map<String, dynamic>();
//   //   mapObj[APIConstants.kProfilePhotoPath] = await makeMultipartFile(selfie);
//   //   // mapObj[APIConstants.kNIDPhoto] = await makeMultipartFile(nidPic);
//   //   // mapObj[APIConstants.kNID] = nidNumber;
//   //   return provider.postRequestFormData(APIConstants.urlUpdateProfile, mapObj, authHeader());
//   // }
//   Future<ServerResponse> uploadNidDocuments(
//       File nidFrontImage, File nidBackImage) async {
//     var mapObj = new Map<String, dynamic>();
//     mapObj[APIConstants.kNidFrontImage] =
//         await makeMultipartFile(nidFrontImage);
//     mapObj[APIConstants.kNidBackImage] = await makeMultipartFile(nidBackImage);
//     return provider.postRequestFormData(
//         APIConstants.urlSubmitNidPhoto, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> uploadPassportDocuments(
//       File passportFrontImage, File passportBackImage) async {
//     var mapObj = new Map<String, dynamic>();
//     mapObj[APIConstants.kPassportFrontImage] =
//         await makeMultipartFile(passportFrontImage);
//     mapObj[APIConstants.kPassportBackImage] = await makeMultipartFile(passportBackImage);
//     return provider.postRequestFormData(
//         APIConstants.urlSubmitPassportPhoto, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> uploadDrivingLicenceDocuments(
//       File drivingLicenseFrontImage, File drivingLicenseBackImage) async {
//     var mapObj = new Map<String, dynamic>();
//     mapObj[APIConstants.kDriverLicenseFrontImage] =
//         await makeMultipartFile(drivingLicenseFrontImage);
//     mapObj[APIConstants.kDriverLicenseBackImage] =
//         await makeMultipartFile(drivingLicenseBackImage);
//     return provider.postRequestFormData(
//         APIConstants.urlSubmitDrivingLicensePhoto, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> verifyPhone(String code) async {
//     var mapObj = {};
//     mapObj[APIConstants.kCode] = code;
//     return provider.postRequest(
//         APIConstants.urlSendPhoneVerificationCode, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> changePassword(
//       String currentPass, String newPassword) async {
//     var mapObj = {};
//     mapObj[APIConstants.kCurrentPassword] = currentPass;
//     mapObj[APIConstants.kPassword] = newPassword;
//     mapObj[APIConstants.kConfirmPassword] = newPassword;
//     return provider.postRequest(
//         APIConstants.urlChangePassword, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> saveLanguage(String language) async {
//     var mapObj = {};
//     mapObj[APIConstants.kLanguage] = language;
//     return provider.postRequest(
//         APIConstants.urlSaveLanguage, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> saveGoogleSecret(
//       String code, String secret, bool isAdd) async {
//     var mapObj = {};
//     mapObj[APIConstants.kCode] = code;
//     mapObj[APIConstants.kRemove] = isAdd ? 0 : 1;
//     mapObj[APIConstants.kGoogle2factSecret] = secret;
//     return provider.postRequest(
//         APIConstants.urlGoogleSecretSave, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> twoFALoginEnableDisable() async {
//     return provider.postRequest(
//         APIConstants.url2FALoginEnableDisable, {}, authHeader());
//   }
//
//   Future<ServerResponse> logoutUser() async {
//     return provider.postRequest(APIConstants.urlLogout, {}, authHeader());
//   }
//
//   Future<ServerResponse> verify2FACodeLogin(String code) async {
//     var mapObj = {};
//     mapObj[APIConstants.kCode] = code;
//     return provider.postRequest(APIConstants.urlGoogle2FACode, mapObj, authHeader());
//   }
//
//   // Future<ServerResponse> addWallet1(int coinId, String walletName) async {
//   //   var mapObj = {};
//   //   mapObj[APIConstants.kWalletName] = walletName;
//   //   mapObj[APIConstants.kCoinId] = coinId;
//   //   return provider.postRequest(APIConstants.urlCreateWallet, mapObj, authHeader());
//   // }
//
//   Future<ServerResponse> addWallet(String walletName, String coinType) async {
//     var mapObj = {};
//     mapObj[APIConstants.kWalletName] = walletName;
//     mapObj[APIConstants.kCoinType] = coinType;
//     //mapObj[APIConstants.kType] = type;
//     return provider.postRequest(APIConstants.urlCreateWallet, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> generateNewAddress(int walletId) async {
//     var mapObj = {};
//     mapObj[APIConstants.kWalletId] = walletId.toString();
//     return provider.postRequest(APIConstants.urlGenerateNewAddress, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> withdrawProcess(
//       int walletId, String code, String address, String amount, String message) async {
//     var mapObj = {};
//     mapObj[APIConstants.kWalletId] = walletId.toString();
//     mapObj[APIConstants.kCode] = code;
//     mapObj[APIConstants.kAddress] = address;
//     mapObj[APIConstants.kAmount] = amount;
//     mapObj[APIConstants.kMessage] = message;
//     return provider.postRequest(APIConstants.urlWithdrawProcess, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> defaultCoinRequest(String email, String amount) async {
//     var mapObj = {};
//     mapObj[APIConstants.kEmail] = email;
//     mapObj[APIConstants.kAmount] = amount;
//     return provider.postRequest(APIConstants.urlDefaultCoinRequest, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> sendDefaultWalletCoinRequest(int walletId, String amount, String email) async {
//     var mapObj = {};
//     mapObj[APIConstants.kWalletId] = walletId.toString();
//     mapObj[APIConstants.kAmount] = amount;
//     mapObj[APIConstants.kEmail] = email;
//     return provider.postRequest(APIConstants.urlSendCoinRequest, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> sendTransferCoinToClubWallet(int walletId, String amount) async {
//     var mapObj = {};
//     mapObj[APIConstants.kWalletId] = walletId.toString();
//     mapObj[APIConstants.kAmount] = amount;
//     return provider.postRequest(APIConstants.urlTransferCoinToClubWallet, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> sendTransferCoinToMainWallet(int walletId, String amount) async {
//     var mapObj = {};
//     mapObj[APIConstants.kWalletId] = walletId.toString();
//     mapObj[APIConstants.kAmount] = amount;
//     return provider.postRequest(APIConstants.urlTransferCoinToMainWallet, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> swapCoin(int fromCoinId,int toCoinId, String amount) async {
//     var mapObj = {};
//     mapObj[APIConstants.kFromCoinId] = fromCoinId.toString();
//     mapObj[APIConstants.kToCoinId] = toCoinId.toString();
//     mapObj[APIConstants.kAmount] = amount;
//     return provider.postRequest(APIConstants.urlSwapCoin, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> getSwapCoinRate(int fromCoinId,int toCoinId,String amount) async {
//     var mapObj = {};
//     mapObj[APIConstants.kFromCoinId] = fromCoinId.toString();
//     mapObj[APIConstants.kToCoinId] = toCoinId.toString();
//     mapObj[APIConstants.kAmount] = int.parse(amount);
//     return provider.postRequest(APIConstants.urlGetCoinRate, mapObj, authHeader());
//   }
//
//   //Future<ServerResponse> getBuyCoinRate(String amount,String paymentType,int payType) async {
//   Future<ServerResponse> getBuyCoinRate(String amount, String coinType, String payType) async {
//     var mapObj = {};
//     mapObj[APIConstants.kAmount] = amount;
//     mapObj[APIConstants.kPaymentType] = coinType;
//     mapObj[APIConstants.kPayType] = payType;
//     return provider.postRequest(APIConstants.urlBuyCoinRate, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> approvalActionForCoinRequest(int requestId,String actionFlag) async {
//     var mapObj = {};
//     mapObj[APIConstants.kRequestId] = requestId.toString();
//     mapObj[APIConstants.kActionFlag] = actionFlag;
//     return provider.postRequest(APIConstants.urlApprovalActionForCoinRequest, mapObj, authHeader());
//   }
//
//   // Future<ServerResponse> buyCoinThroughApp(String coin, int paymentType, String paymentCoinType,
//   //     int bankId,int bankDepositId, File bankSlipImage) async {
//   //   var mapObj = {};
//   //   //mapObj[APIConstants.kPhaseId] = phaseId.toString();
//   //    mapObj[APIConstants.kCoin] = coin;
//   //    mapObj[APIConstants.kPaymentType] = paymentType.toString();
//   //    mapObj[APIConstants.kPaymentCoinType] = paymentCoinType;
//   //    mapObj[APIConstants.kBankId] = bankId.toString();
//   //    mapObj[APIConstants.kBankDepositId] = bankDepositId.toString();
//   //    mapObj[APIConstants.kBankSlipImage] = await makeMultipartFile(bankSlipImage);
//   //    //mapObj[APIConstants.kStripeToken] = stripeToken.toString();
//   //   return provider.postRequest(APIConstants.urlBuyCoinThroughApp, mapObj, authHeader());
//   // }
//
//   Future<ServerResponse> buyCoinThroughAppByCoin(String coin, String paymentType, String paymentCoinType) async {
//   //Future<ServerResponse> buyCoinThroughAppByCoin(String coin) async {
//     var mapObj = {};
//     //mapObj[APIConstants.kPhaseId] = phaseId.toString();
//      mapObj[APIConstants.kCoin] = coin;
//      mapObj[APIConstants.kPaymentType] = paymentType;
//      mapObj[APIConstants.kPaymentCoinType] = paymentCoinType;
//     return provider.postRequest(APIConstants.urlBuyCoinThroughApp, mapObj, authHeader());
//   }
//
//   Future<ServerResponse> buyCoinThroughAppByBank(String coin, String paymentType,
//       int bankId, int bankDepositId, File bankSlipImage) async {
//     //Future<ServerResponse> buyCoinThroughAppByBank(String coin) async {
//     var mapObj =  <String, dynamic>{};
//       mapObj[APIConstants.kCoin] = coin;
//       mapObj[APIConstants.kPaymentType] = paymentType;
//       mapObj[APIConstants.kBankId] = bankId.toString();
//      // mapObj[APIConstants.kBankDepositId] = bankDepositId.toString();
//       mapObj[APIConstants.kBankSlipImage] = await makeMultipartFile(bankSlipImage);
//     return provider.postRequestFormData(APIConstants.urlBuyCoinThroughApp, mapObj, authHeader());
//   }
//
// //
// // Future<ServerResponse> updateAvatarData(List<int> img, String filename) async {
// //   return provider.uploadFile(APIConstants.urlUpdateProfilePicture, img, filename, authHeader());
// // }
//
//   /// *** GET requests *** ///
//
// // Future<ServerResponse> logoutUser() async {
// //   return provider.getRequest(APIConstants.urlLogout, authHeader());
// // }
// //
// // Future<ServerResponse> getGeneralSetting() async {
// //   return provider.getRequest(APIConstants.urlGeneralSettings, null);
// // }
// //
//   Future<ServerResponse> getSelfProfile() async {
//     return provider.getRequest(APIConstants.urlMyProfileView, authHeader());
//   }
//
//   Future<ServerResponse> getEditProfileData() async {
//     return provider.getRequest(APIConstants.urlMyProfileEdit, authHeader());
//   }
//
//   Future<ServerResponse> getIdVerification() async {
//     return provider.getRequest(APIConstants.urlIdVerification, authHeader());
//   }
//
//   //Future<ServerResponse> getNotificationItems(int page) async {
//   Future<ServerResponse> getNotificationItems() async {
//     var mapObj = new Map<String, String>();
//     //mapObj[APIConstants.kPage] = page.toString();
//     return provider.getRequest(APIConstants.urlNotificationList, authHeader(),
//         query: mapObj);
//   }
//
//   Future<ServerResponse> sendSms() async {
//     return provider.getRequest(APIConstants.urlPhoneVerification, authHeader());
//   }
//
//   Future<ServerResponse> getFAQList(int page) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kPage] = "$page";
//     mapObj[APIConstants.kLimit] = DefaultValue.listLimitLarge.toString();
//     return provider.getRequest(APIConstants.urlFAQList, authHeader(),
//         query: mapObj);
//   }
//   Future<ServerResponse> getGeneralSetting() async {
//     return provider.getRequest(APIConstants.urlGeneralSettings, authHeader());
//   }
//
//   Future<ServerResponse> getSettings() async {
//     return provider.getRequest(APIConstants.urlSettingsData, authHeader());
//   }
//
//   Future<ServerResponse> getActivityList(int page) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kPage] = "$page";
//     mapObj[APIConstants.kLimit] = DefaultValue.listLimitLarge.toString();
//     return provider.getRequest(APIConstants.urlActivityList, authHeader(),
//         query: mapObj);
//   }
//
//   Future<ServerResponse> getPocketWalletList(int page) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kPage] = "$page";
//     mapObj[APIConstants.kLimit] = DefaultValue.listLimitLarge.toString();
//     return provider.getRequest(APIConstants.urlMyPocketWalletList, authHeader(), query: mapObj);
//   }
//
//   Future<ServerResponse> getDefaultWalletDropdownList() async {
//     return provider.getRequest(APIConstants.urlDefaultRequestCoinApp, authHeader());
//   }
//
//   Future<ServerResponse> getPocketWalletCoinList() async {
//     return provider.getRequest(APIConstants.urlPocketWalletCoinList, authHeader());
//   }
//   Future<ServerResponse> getWalletAddress(int walletId) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kWalletId] = "$walletId";
//     return provider.getRequest(APIConstants.urlGoToAddress, authHeader(), query: mapObj);
//   }
//
//   Future<ServerResponse> getPassAddress(int walletId) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kWalletId] = "$walletId";
//     return provider.getRequest(APIConstants.urlShowPassAddress, authHeader(), query: mapObj);
//   }
//
//   Future<ServerResponse> getAWallet(int walletId) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kWalletId] = walletId.toString();
//     return provider.getRequest(APIConstants.urlWalletDetails, authHeader(), query: mapObj);
//   }
//   // Future<ServerResponse> getWalletTransactionList(int walletId, String type, int page) async {
//   //   var mapObj = <String, String>{};
//   //   mapObj[APIConstants.kWalletId] = "$walletId";
//   //   mapObj[APIConstants.kPage] = "$page";
//   //   mapObj[APIConstants.kLimit] = DefaultValue.listLimitMedium.toString();
//   //   String url = type == FromKey.depositList ? APIConstants.urlDepositList : APIConstants.urlWithdrawList;
//   //   return provider.getRequest(url, authHeader(), query: mapObj);
//   // }
//   Future<ServerResponse> getWalletTransactionList(int walletId,int receiverWalletId, String type, int page) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kWalletId] = "$walletId";
//     mapObj[APIConstants.kReceiverWalletId] = "$receiverWalletId";
//     mapObj[APIConstants.kPage] = "$page";
//     mapObj[APIConstants.kLimit] = DefaultValue.listLimitMedium.toString();
//     String url = type == FromKey.depositList ? APIConstants.urlDepositList : APIConstants.urlWithdrawList;
//     return provider.getRequest(url, authHeader(), query: mapObj);
//   }
//
//   Future<ServerResponse> getDepositOrWithdrawList(String type, int page, bool isAll) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kType] = type;
//     mapObj[APIConstants.kPage] = "$page";
//     mapObj[APIConstants.kLimit] = (isAll ? DefaultValue.listLimitLarge : DefaultValue.listLimitShort).toString();
//     return provider.getRequest(APIConstants.urlDepositOrWithdrawList, authHeader(), query: mapObj);
//   }
//
//   Future<ServerResponse> getReferralLink() async {
//     return provider.getRequest(APIConstants.urlGenerateReferralLink, authHeader());
//   }
//
//   Future<ServerResponse> getReferralAndReference() async {
//     return provider.getRequest(APIConstants.urlReferenceAndReferral, authHeader());
//   }
//
//   Future<ServerResponse> getEarning(bool isAll) async {
//     var mapObj = <String, String?>{};
//     mapObj[APIConstants.kLimit] = isAll ? null : 6.toString();
//     return provider.getRequest(APIConstants.urlEarning, authHeader(), query: mapObj);
//   }
//
//   Future<ServerResponse> getReferenceList() async {
//     return provider.getRequest(APIConstants.urlReferenceList, authHeader());
//   }
//
//   Future<ServerResponse> getDashBoardData() async {
//     return provider.getRequest(APIConstants.urlDashBoard, authHeader());
//   }
//
//   Future<ServerResponse> getBuyCoinHistoryList(int page) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kPage] = "$page";
//     mapObj[APIConstants.kLimit] = DefaultValue.listLimitLarge.toString();
//     return provider.getRequest(APIConstants.urlBuyCoinHistoryList, authHeader(),query: mapObj);
//   }
//
//   Future<ServerResponse> getSendCoinHistoryList(int page) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kPage] = "$page";
//     mapObj[APIConstants.kLimit] = DefaultValue.listLimitShort.toString();
//     return provider.getRequest(APIConstants.urlSendCoinHistoryList, authHeader(), query: mapObj);
//   }
//
//   Future<ServerResponse> getReceiveCoinHistoryList(int page) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kPage] = "$page";
//     mapObj[APIConstants.kLimit] = DefaultValue.listLimitShort.toString();
//     return provider.getRequest(APIConstants.urlReceiveCoinHistoryList, authHeader(), query: mapObj);
//   }
//
//   Future<ServerResponse> getPendingCoinHistoryList(int page) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kPage] = "$page";
//     mapObj[APIConstants.kLimit] = DefaultValue.listLimitShort.toString();
//     return provider.getRequest(APIConstants.urlPendingCoinHistoryList, authHeader(), query: mapObj);
//   }
//
//   Future<ServerResponse> getBuyCoinAndPhaseInformation() async {
//     return provider.getRequest(APIConstants.urlBuyCoinAndPhaseInformation, authHeader());
//   }
//
//   Future<ServerResponse> getMembershipBonusHistoryList(int page, bool isAll) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kPage] = "$page";
//     mapObj[APIConstants.kLimit] = (isAll ? DefaultValue.listLimitLarge : DefaultValue.listLimitShort).toString();
//     return provider.getRequest(APIConstants.urlMembershipBonusHistoryList, authHeader(), query: mapObj);
//   }
//
//   Future<ServerResponse> getMembershipDetails() async {
//     return provider.getRequest(APIConstants.urlMembershipDetails, authHeader());
//   }
//
//   Future<ServerResponse> getAllMembershipPlanList() async {
//     return provider.getRequest(APIConstants.urlAllMembershipPlanList, authHeader());
//   }
//
//   Future<ServerResponse> getSwapCoinAllWalletDropdownList() async {
//     return provider.getRequest(APIConstants.urlSwapCoinAllWallet, authHeader());
//   }
//
//   Future<ServerResponse> getSwapCoinHistoryList(int page) async {
//     var mapObj = <String, String>{};
//     mapObj[APIConstants.kPage] = "$page";
//     mapObj[APIConstants.kLimit] = DefaultValue.listLimitShort.toString();
//     return provider.getRequest(APIConstants.urlSwapCoinHistoryList, authHeader(), query: mapObj);
//   }
//
// //
// // Future<ServerResponse> getPaymentOptions() async {
// //   return provider.getRequest(APIConstants.urlPaymentOptions, authHeader());
// // }
// //
//
//   /// *** SOCKET requests *** ///
//
// // void subscribeEvent(int auctionId, SocketListener listener) {
// //   String channelBid = SocketConstants.channelBid + auctionId.toString();
// //   socketProvider.subscribeEvent(channelBid, listener);
// //   String channelMessage = SocketConstants.channelLiveMessage + auctionId.toString();
// //   socketProvider.subscribeEvent(channelMessage, listener);
// // }
// //
// // void unSubscribeEvent(int auctionId, SocketListener listener) {
// //   String channelBid = SocketConstants.channelBid + auctionId.toString();
// //   socketProvider.unSubscribeEvent(channelBid, listener);
// //   String channelLive = SocketConstants.channelLiveMessage + auctionId.toString();
// //   socketProvider.unSubscribeEvent(channelLive, listener);
// // }
// }
