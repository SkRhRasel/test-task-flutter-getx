import 'package:get/get.dart';

class RootController extends GetxController {

  // @override
  // void onReady() {
  //   super.onReady();
  //   NetworkCheck.isOnline().then((value) {
  //     if (value) {
  //       Future.delayed(const Duration(seconds: 1), () {
  //         if(!GetStorage().read(PrefKeyConstant.isLoggedIn)) {
  //           Get.off(() => const RootScreen());
  //         } else if (!GetStorage().read(PrefKeyConstant.kIsOnBoardingDone)) {
  //           Get.off(() => const OnBoardingScreen());
  //         } else {
  //           Get.off(() => const WelcomePage());
  //         }
  //       });
  //     }
  //   });
  //
  // }

  // var selectedIndex = 0.obs;
  var selectedDrawerItem = 0.obs;

  // Rx<User> userRx = User(id: 0, name: "", email: "", isEmailVerified: false, username: "").obs;

  // void onItemTapped(int index) {
  //     selectedIndex.value = index;
  // }


//   Rx<UserClubInfo> userClubInfoRx = UserClubInfo().obs;
//   Rx<GeneralSettings> generalSettings = GeneralSettings().obs;
//

//   Rx<File> profileImage = File("").obs;
//
//   void setMyProfile() {
//     var userMap = GetStorage().read(PrefKeyConstant.userObject);
//     if (userMap != null) {
//       try {
//         userRx.value = User.fromJson(userMap);
//       } catch (_) {
//         GetUtils.printFunction("setMyProfile", _, "error");
//       }
//     }
//     Future.delayed(const Duration(seconds: 3), () {
//       getMyProfile();
//       //getGeneralSettings();
//     });
//   }
//
//   void getMyProfile() {
//     APIRepository().getSelfProfile().then((resp) {
//       if (resp == null) return;
//       if (resp.success) {
//         var userMap = resp.data[APIConstants.queryMe];
//         if (userMap != null) {
//           GetStorage().write(PrefKeyConstant.userObject, userMap);
//           userRx.value = User.fromJson(userMap);
//         }
//       }
//     });
//   }
//
//   void logOut() {
//     showLoadingDialog();
//     APIRepository().logoutUser().then((resp) {
//       hideLoadingDialog();
//       showToast(resp.message);
//       if (resp.success) {
//         GetStorage().erase();
//         Get.off(() => const SignInPage());
//       }
//     }, onError: (err) {
//       hideLoadingDialog();
//       if (err.toString() == ErrorConstants.unauthorized.tr){
//         GetStorage().erase();
//         Get.off(() => const SignInPage());
//       }else {
//         showToast(err.toString());
//       }
//     });
//   }


}
