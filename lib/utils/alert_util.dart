import 'package:flutter/material.dart';
import 'package:test_task_flutter_getx/utils/text_field_util.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import '../data/local/constants.dart';
import 'button_util.dart';
import 'spacers.dart';
import 'widgets.dart';
import 'decorations.dart';
import 'dimens.dart';

void alertForVerifyAccount(BuildContext context, String email) {
  Get.defaultDialog(
    title: "",
    radius: dp10,
    backgroundColor: Get.theme.primaryColorDark,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        textAutoSize(context,text: "Need verification".tr,
            textAlign: TextAlign.center, fontSize: dp24),
        const VSpacer10(),
        textAutoSize(context,text: "Your account is unverified. Please verify your account".tr,
            maxLines: 4,
            textAlign: TextAlign.center,
            fontSize: dp14,
            fontWeight: FontWeight.normal),
        const VSpacer20(),
        buttonRoundedMain(
            text: "Verify".tr,
            onPressCallback: () {
              Get.back();
              //Get.off(() => EmailVerifyPage(email));
            },
            width: Get.width / 2),
        const VSpacer10(),
      ],
    ),
  );
}

void getAlertDialogAddPocket({VoidCallback? buttonAction}) {
  Get.defaultDialog(
    title: "Want to add new pocket?",
    titleStyle: Get.theme.textTheme.headline1,
    radius: dp10,
    backgroundColor: Get.theme.primaryColor.withOpacity(0.03),
    content: Container(
      height: Get.width / 2,
      width: Get.width,
      //padding: EdgeInsets.symmetric(vertical: dp20, horizontal: dp15),
      decoration: getRoundSoftTransparentBox(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpacer20(),
          textBodyBold14(text: "Coin Amount"),
          const VSpacer10(),
          textFieldBorderedMain(
              hintText: "Your Amount", textInputType: TextInputType.number, text: ''),
          const VSpacer10(),
          textBodyBold14(text: "Select Your Wallet"),
          const VSpacer10(),
          //_walletTypeFilter(),
          const VSpacer10(),
        ],
      ),
    ),
  );
}

changePhotoModalBottomSheet(VoidCallback onPress, VoidCallback onPress2, {double width = 0}) => Get.bottomSheet(
      Container(
          alignment: Alignment.bottomCenter,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buttonRoundedFill("Take a picture".tr, onPress, width: width,textColor: Get.theme.primaryColorLight, bgColor: Get.theme.secondaryHeaderColor),
              horizontalDivider(margin: (Get.width - width) / 2),
              buttonRoundedFill("Choose a picture".tr, onPress2, width: width,textColor: Get.theme.primaryColorLight, bgColor: Get.theme.secondaryHeaderColor),
              horizontalDivider(margin: (Get.width - width) / 2),
              buttonRoundedFill("Cancel".tr, () {
                Get.back();
              }, width: width, bgColor: Get.theme.primaryColorDark,textColor: Get.theme.primaryColorLight),
            ],
          )),
      isDismissible: true,
    );

void showModalSheetFullScreen(Widget customView, BuildContext context, {Function? onClose}) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                buttonOnlyIcon(onPressCallback: () {
                  Get.back();
                  if (onClose != null) {
                    onClose();
                  }
                }, iconPath: AssetConstants.icCloseBox, size: dp30)
              ],
            ),
              const VSpacer20(),
            customView
          ],
        );
      });
}


