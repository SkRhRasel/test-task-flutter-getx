import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'decorations.dart';
import 'dimens.dart';

Widget textAutoSize(
    {required String text,
    VoidCallback? onTap,
    double hMargin = 0,
    int maxLines = 1,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double? width,
    TextAlign textAlign = TextAlign.start,
    double fontSize = Dimens.regularFontSizeMid,
    TextDecoration? decoration}) {
  var colorL = color ?? Get.theme.primaryColorDark;
  var widthL = width ?? Get.width;
  return Container(
    // width: widthL,
    //color: Colors.red,
    margin: EdgeInsets.only(left: hMargin, right: hMargin),
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        minFontSize: Dimens.regularFontSizeMid,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: Get.theme.textTheme.bodyMedium!.copyWith(
            color: colorL,
            fontWeight: fontWeight,
            fontSize: fontSize,
            decoration: decoration),
      ),
      onTap: onTap,
    ),
  );
}

Widget textAutoSizePoppins(BuildContext context,
    {required String text,
    VoidCallback? onTap,
    double hMargin = 0,
    double vMargin = 0,
    int maxLines = 1,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double? width,
    TextAlign textAlign = TextAlign.start,
    double fontSize = Dimens.regularFontSizeMid,
    TextDecoration? decoration}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  var colorL = color ?? Get.theme.primaryColorLight;
  var widthL = width ?? screenWidth;
  return Container(
    // width: widthL,
    //color: Colors.red,
    margin: EdgeInsets.only(
        left: hMargin, right: hMargin, top: vMargin, bottom: vMargin),
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        minFontSize: Dimens.regularFontSizeSmall,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: Get.theme.textTheme.labelSmall!.copyWith(
            color: colorL,
            fontWeight: fontWeight,
            fontSize: fontSize,
            decoration: decoration),
      ),
      onTap: onTap,
    ),
  );
}

Widget textAutoSizeKarla(BuildContext context,
    {required String text,
    VoidCallback? onTap,
    double hMargin = 0,
    double vMargin = 0,
    int maxLines = 1,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double? width,
    TextAlign textAlign = TextAlign.start,
    double fontSize = Dimens.regularFontSizeMid,
    TextDecoration? decoration}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  var colorL = color ?? Get.theme.primaryColorLight;
  var widthL = width ?? screenWidth;
  return Container(
    // width: widthL,
    //color: Colors.red,
    margin: EdgeInsets.only(
        left: hMargin, right: hMargin, top: vMargin, bottom: vMargin),
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        minFontSize: Dimens.regularFontSizeSmall,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: Get.theme.textTheme.bodySmall!.copyWith(
            color: colorL,
            fontWeight: fontWeight,
            fontSize: fontSize,
            decoration: decoration),
      ),
      onTap: onTap,
    ),
  );
}

Widget textAutoSizeDMSans(
    {required String text,
    VoidCallback? onTap,
    double hMargin = 0,
    int maxLines = 1,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double? width,
    TextAlign textAlign = TextAlign.start,
    double fontSize = Dimens.regularFontSizeMid,
    TextDecoration? decoration}) {
  double screenWidth = Get.width;
  double screenHeight = Get.height;
  var colorL = color ?? Get.theme.primaryColorDark;
  var widthL = width ?? screenWidth;
  return Container(
    // width: widthL,
    //color: Colors.red,
    margin: EdgeInsets.only(left: hMargin, right: hMargin),
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        minFontSize: Dimens.regularFontSizeMid,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: Get.theme.textTheme.labelMedium!.copyWith(
            color: colorL,
            fontWeight: fontWeight,
            fontSize: fontSize,
            decoration: decoration),
      ),
      onTap: onTap,
    ),
  );
}
