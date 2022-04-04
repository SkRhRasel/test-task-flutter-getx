import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_flutter_getx/data/local/constants.dart';
import 'package:test_task_flutter_getx/utils/decorations.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import 'dimens.dart';
import 'image_util.dart';
Widget buttonRoundedMain(
    {required String text,
      VoidCallback? onPressCallback,
      Color? textColor,
      Color? bgColor,double buttonHeight = 50,
      double width = 0, double? borderRadius = Dimens.borderRadiusExtraLarge}) {
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
                      side: const BorderSide(color: kButtonBg)))),
          onPressed: onPressCallback));
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

Widget buttonText(String text, VoidCallback action, {double fontSize = 15}) {
  return Container(
    margin: const EdgeInsets.all(0),
    padding: const EdgeInsets.all(0),
    alignment: Alignment.center,
    child: TextButton(
      onPressed: action,
      child: textAutoSize(
        text: text,
      ),
    ),
  );
}


Widget buttonRoundedWithIconSmall(
    String text, IconData iconPath, VoidCallback onPressCallback,
    {double? margin}) {
  return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.all(Dimens.paddingMin),
      height: 35,
      // width: 135,
      child: ElevatedButton.icon(
        icon: imageView(
          icon: iconPath,
          height: 5,
          color: Get.theme.primaryColor,
        ),
        label:
            textAutoSize(text: text, color: Get.theme.primaryColor),
        onPressed: onPressCallback,
        style: ElevatedButton.styleFrom(
          primary: kGreenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.borderRadiusExtraLarge),
          ),
        ),
      ));
}
