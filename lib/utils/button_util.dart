import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_flutter_getx/data/local/constants.dart';
import 'package:test_task_flutter_getx/utils/decorations.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import 'dimens.dart';
import 'image_util.dart';

Widget buttonRoundedFill(String text, VoidCallback onPressCallback,
    {double width = 0,
    double height = 50,
    double margin = 10,
    Color? textColor,
    Color? bgColor,
    Color? borderColor}) {
  double buttonWidth = width == 0 ? Get.width : width;
  var bgColorL = bgColor ?? Get.theme.colorScheme.secondary;
  var borderColorL = borderColor ?? bgColorL;
  var textColorL = textColor ?? Get.theme.primaryColorDark;
  return Container(
      margin: EdgeInsets.all(margin),
      height: height,
      width: buttonWidth,
      child: ElevatedButton(
          child: AutoSizeText(
            text,
            style: Get.textTheme.button!.copyWith(color: textColorL),
            maxLines: 1,
            minFontSize: 5,
          ),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(bgColorL),
              backgroundColor: MaterialStateProperty.all<Color>(bgColorL),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      side: BorderSide(color: borderColorL)))),
          onPressed: onPressCallback));
}

Widget buttonRoundedMain(
    {required String text,
    VoidCallback? onPressCallback,
    Color? textColor,
    Color? bgColor,double buttonHeight = dp50,
    double width = dp0, double? borderRadius = Dimens.borderRadiusExtraLarge}) {
  double buttonWidth = width == 0 ? Get.width : width;
  return Container(
      margin: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
          child: textAutoSizeDMSans( text: text),
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(kButtonBg),
              backgroundColor:
                  MaterialStateProperty.all<Color>(kButtonBg),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
                      side: BorderSide(color: kButtonBg)))),
          onPressed: onPressCallback));
}

Widget buttonRoundedAccent(BuildContext context,
    {required String text,
    VoidCallback? onPressCallback,
    Color? textColor,
    Color? bgColor,double buttonHeight = 45,
    double width = dp0}) {
  double buttonWidth = width == 0 ? Get.width : width;
  return Container(
      margin: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
          child: AutoSizeText(text, style: Get.theme.textTheme.labelLarge,minFontSize: 10),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                  Get.theme.colorScheme.secondary),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Get.theme.colorScheme.secondary),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(Dimens.borderRadius)),
                      side: BorderSide(
                          color: Get.theme.colorScheme.secondary)))),
          onPressed: onPressCallback));
}

Widget buttonRoundedWarning(BuildContext context,
    {required String text,
    VoidCallback? onPressCallback,
    Color? textColor,
    Color? bgColor,
    double width = dp0}) {
  double buttonWidth = width == 0 ? Get.width : width;
  return Container(
      margin: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
      height: dp50,
      width: buttonWidth,
      child: ElevatedButton(
          child: AutoSizeText(text, style: Get.theme.textTheme.labelLarge),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                  Get.theme.errorColor),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Get.theme.errorColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(Dimens.borderRadius)),
                      side: BorderSide(color: Get.theme.errorColor)))),
          onPressed: onPressCallback));
}

Widget buttonRoundedWhite(
    {required String text,
    VoidCallback? onPressCallback,
    Color? textColor,
    Color? bgColor,
    double width = dp0}) {
  double buttonWidth = width == 0 ? Get.width : width;
  return Container(
      margin: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
      height: dp50,
      width: buttonWidth,
      child: ElevatedButton(
          child: AutoSizeText(text,
              style: Get.theme.textTheme.button!
                  .copyWith(color: Get.theme.primaryColor)),
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(Get.theme.primaryColorLight),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Get.theme.primaryColorLight),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(dp4)),
                      side: BorderSide(color: Get.theme.primaryColor)))),
          onPressed: onPressCallback));
}

Widget buttonRoundedWithIcon(
    String text, String iconPath, VoidCallback onPressCallback,
    {double width = 0, Color? textColor, Color? bgColor, Color? borderColor}) {
  double buttonWidth = width == 0 ? Get.width : width;
  var bgColorL = bgColor ?? Get.theme.colorScheme.secondary;
  var borderColorL = borderColor ?? bgColorL;
  var textColorL = textColor ?? Get.theme.primaryColorDark;
  return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
      width: buttonWidth,
      child: ElevatedButton.icon(
        icon: SvgPicture.asset(
          iconPath,
          height: 25,
        ),
        label: AutoSizeText(
          text,
          style:
              Get.textTheme.button!.copyWith(color: textColorL, fontSize: 14),
          maxLines: 1,
        ),
        onPressed: onPressCallback,
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(bgColorL),
            backgroundColor: MaterialStateProperty.all<Color>(bgColorL),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    side: BorderSide(color: borderColorL)))),
      ));
}

Widget buttonOnlyIcon(
    {VoidCallback? onPressCallback,
    String iconPath = "",
    double size = Dimens.iconSize,
    Color? iconColor,
    Color bgColor = Colors.transparent}) {
  return Material(
    color: bgColor,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    child: IconButton(
      iconSize: size,
      padding: EdgeInsets.zero,
      onPressed: onPressCallback,
      icon: iconPath.isNotEmpty
          ? iconPath.contains(".svg")
              ? SvgPicture.asset(
                  iconPath,
                  //width: size,
                  //height: size,
                  color: iconColor,
                )
              : Image.asset(
                  iconPath,
                  //width: size,
                  //height: size,
                  color: iconColor,
                )
          : const SizedBox(),
    ),
  );
}

Widget buttonOnlyIcon2({
  IconData? icon,
  VoidCallback? onPressCallback,
  String iconPath = "",
  double? size = Dimens.iconSize,
  Color? iconColor,
  double? iconSize,
}) {
  return Material(
    color: Colors.transparent,
    child: IconButton(
      onPressed: onPressCallback,
      icon: iconPath.isNotEmpty
          ? iconPath.contains(".svg")
              ? SvgPicture.asset(
                  iconPath,
                  width: size,
                  height: size,
                  color: iconColor,
                )
              : Image.asset(
                  iconPath,
                  width: size,
                  height: size,
                  color: iconColor,
                )
          : Icon(
              icon!,
              size: iconSize,
              color: iconColor,
            ),
    ),
  );
}

Widget buttonText(String text, VoidCallback action, {double fontSize = dp15}) {
  return Container(
    margin: const EdgeInsets.all(dp0),
    padding: const EdgeInsets.all(dp0),
    alignment: Alignment.center,
    child: TextButton(
      onPressed: action,
      child: textAutoSizeBold15(
        text: text,
      ),
    ),
  );
}
Widget buttonLoadMore(BuildContext context, {double fontSize = dp15, VoidCallback? action}) {
  return InkWell(
    onTap: action,
    child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width/2,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: boxDecorationRoundBorder(borderColor: Get.theme.dividerColor),
        child: textAutoSizeDMSans( text: 'Load more'.tr)),
  );
}
Widget buttonBorder(BuildContext context, {String? btnText, double fontSize = dp15,double radius = 12, VoidCallback? action,double? btnWidth}) {
  var width = btnWidth ?? MediaQuery.of(context).size.width/2.2;
  return InkWell(
    onTap: action,
    child: Container(
        height: 50,
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: boxDecorationRoundBorder(borderColor: Get.theme.dividerColor,radius: radius),
        child: textAutoSizeDMSans( text: btnText!)),
  );
}

Widget buttonIconWithRoundBg(String iconPath,
    {VoidCallback? onPress,
    Color? iconColor,
    Color? bgColor,
    double size = 25,
    double padding = 10}) {
  var bgColorL = bgColor ?? Get.theme.colorScheme.secondary;
  var iconColorL = iconColor ?? bgColorL;
  return RawMaterialButton(
    onPressed: onPress,
    fillColor: bgColorL.withOpacity(0.3),
    elevation: 0,
    child: SvgPicture.asset(
      iconPath,
      color: iconColorL,
      width: size,
      height: size,
    ),
    padding: EdgeInsets.all(padding),
    shape: const CircleBorder(),
  );
}

Widget buttonIconWithBorder(String iconPath, VoidCallback onPress,
    {Color? iconColor, double size = 50}) {
  return Container(
      height: size,
      width: size,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 0.25)),
      child: buttonOnlyIcon(
          onPressCallback: onPress, iconPath: iconPath, iconColor: iconColor));
}

Widget buttonRoundedWithIconSmall(
    String text, String iconPath, VoidCallback onPressCallback,
    {double? margin}) {
  return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.all(dp10),
      height: dp20,
      width: dp65,
      child: ElevatedButton.icon(
        icon: imageView(
          imagePath: iconPath,
          height: dp5,
          color: Get.theme.primaryColorLight,
        ),
        label:
            textAutoSizeBold12(text: text, color: Get.theme.primaryColorLight),
        onPressed: onPressCallback,
        style: ElevatedButton.styleFrom(
          primary: Get.theme.colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dp7),
          ),
        ),
      ));
}
