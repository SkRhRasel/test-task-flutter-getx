import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common_utils.dart';
import 'decorations.dart';
import 'dimens.dart';

Widget textAutoSize(
    {required String text,
    VoidCallback? onTap,
    double hMargin = dp0,
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
    double hMargin = dp0,
    double vMargin = dp0,
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
    double hMargin = dp0,
    double vMargin = dp0,
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

Widget textAutoSizeDMSans(BuildContext context,
    {required String text,
    VoidCallback? onTap,
    double hMargin = dp0,
    int maxLines = 1,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double? width,
    TextAlign textAlign = TextAlign.start,
    double fontSize = Dimens.regularFontSizeMid,
    TextDecoration? decoration}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
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

Widget textSpanDMSans(BuildContext context,
    {String? mainText,
    String? spanText,
    VoidCallback? onTap, Color? mainTextColor, Color? spanTextColor,
    int maxLines = 1,
    double fontSize = 15,
    TextAlign textAlign = TextAlign.center,
    FontWeight fontWeight = FontWeight.bold,
    TextDecoration? decoration}) {
  var colorText = mainTextColor ?? Get.theme.primaryColorDark;
  var colorSpan = spanTextColor ?? Get.theme.colorScheme.secondary;
  return AutoSizeText.rich(
    TextSpan(
      text: mainText,
      style: Get.theme.textTheme.labelMedium!.copyWith(
          color: colorText,
          fontWeight: fontWeight,
          fontSize: fontSize,
          decoration: decoration),
      children: <TextSpan>[
        TextSpan(
            text: spanText,
            style: Get.theme.textTheme.labelMedium!.copyWith(
                fontSize: fontSize,
                color: colorSpan,
                fontWeight: fontWeight),
            recognizer: TapGestureRecognizer()..onTap = onTap),
      ],
    ),
    maxLines: maxLines,
  );
}

Widget textAutoSizeHeadlineMedium(
  BuildContext context, {
  required String text,
  VoidCallback? onTap,
  double hMargin = dp0,
  int maxLines = 2,
  Color? color,
  FontWeight fontWeight = FontWeight.normal,
  double? width,
  TextAlign textAlign = TextAlign.center,
  TextDecoration? decoration,
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
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
        style: Get.theme.textTheme.headlineMedium,
      ),
      onTap: onTap,
    ),
  );
}

Widget textAutoSizeLabelSmallSubtitle(BuildContext context,
    {required String text,
    VoidCallback? onTap,
    double hMargin = dp0,
    int maxLines = 2,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = Dimens.regularFontSizeMid,
    double? width,
    TextAlign textAlign = TextAlign.center,
    TextDecoration? decoration}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  var colorL = color ?? Get.theme.primaryColorLight;
  var widthL = width ?? screenWidth;
  return Container(
    // width: widthL,
    //color: Colors.red,
    margin: EdgeInsets.only(left: hMargin, right: hMargin),
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        minFontSize: Dimens.regularFontSizeSmall,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: Get.theme.textTheme.labelSmall!.copyWith(
            color: colorL, fontSize: fontSize, decoration: decoration),
      ),
      onTap: onTap,
    ),
  );
}

Widget textAutoSizeBodyMedium(BuildContext context,
    {required String text,
    VoidCallback? onTap,
    double hMargin = dp0,
    int maxLines = 1,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double? width,
    TextAlign textAlign = TextAlign.center,
    TextDecoration? decoration}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  var colorL = color ?? Get.theme.primaryColorDark;
  var widthL = width ?? screenWidth;
  return Container(
    width: widthL,
    //color: Colors.red,
    margin: EdgeInsets.only(left: hMargin, right: hMargin),
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        minFontSize: Dimens.regularFontSizeExtraMid,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: Get.theme.textTheme.bodyMedium,
      ),
      onTap: onTap,
    ),
  );
}

Widget textAutoSizeBold15(
    {required String text,
    VoidCallback? onTap,
    double hMargin = dp0,
    int maxLines = 1,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double? width,
    TextAlign textAlign = TextAlign.start,
    double fontSize = Dimens.regularFontSizeMid,
    TextDecoration? decoration}) {
  var colorL = color ?? Get.theme.primaryColorDark;
  var widthL = width;
  return Container(
    width: widthL,
    //color: Colors.red,
    margin: EdgeInsets.only(left: hMargin, right: hMargin),
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        minFontSize: Dimens.regularFontSizeSmall,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: Get.textTheme.headline5!.copyWith(
            color: colorL,
            fontWeight: FontWeight.bold,
            fontSize: dp15,
            decoration: decoration),
      ),
      onTap: onTap,
    ),
  );
}

Widget textAutoSizeBold12(
    {required String text,
    VoidCallback? onTap,
    double hMargin = dp0,
    int maxLines = 1,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double? width,
    TextAlign textAlign = TextAlign.start,
    double fontSize = dp12,
    TextDecoration? decoration}) {
  var colorL = color ?? Get.theme.primaryColorDark;
  var widthL = width;
  return Container(
    width: widthL,
    //color: Colors.red,
    margin: EdgeInsets.only(left: hMargin, right: hMargin),
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        minFontSize: dp12,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: Get.textTheme.headline5!.copyWith(
            color: colorL,
            fontWeight: FontWeight.bold,
            fontSize: dp12,
            decoration: decoration),
      ),
      onTap: onTap,
    ),
  );
}

Widget textAutoSizeNormal16(
    {required String text,
    VoidCallback? onTap,
    double hMargin = dp0,
    int maxLines = 1,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double? width,
    TextAlign textAlign = TextAlign.start,
    double fontSize = dp12,
    TextDecoration? decoration}) {
  var colorL = color ?? Get.theme.primaryColorDark;
  var widthL = width;
  return Container(
    width: widthL,
    //color: Colors.red,
    margin: EdgeInsets.only(left: hMargin, right: hMargin),
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        minFontSize: dp12,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: Get.textTheme.headline5!.copyWith(
            color: colorL,
            fontWeight: FontWeight.normal,
            fontSize: dp16,
            decoration: decoration),
      ),
      onTap: onTap,
    ),
  );
}

Widget textAutoSizeNormal12(
    {required String text,
    VoidCallback? onTap,
    double hMargin = dp0,
    int maxLines = 1,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double? width,
    TextAlign textAlign = TextAlign.start,
    double fontSize = dp12,
    TextDecoration? decoration}) {
  var colorL = color ?? Get.theme.primaryColorDark;
  var widthL = width;
  return Container(
    width: widthL,
    //color: Colors.red,
    margin: EdgeInsets.only(left: hMargin, right: hMargin),
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        minFontSize: dp12,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: Get.textTheme.headline5!.copyWith(
            color: colorL,
            fontWeight: FontWeight.normal,
            fontSize: dp12,
            decoration: decoration),
      ),
      onTap: onTap,
    ),
  );
}

Widget textAutoSizeBoldDark16(
    {required String text,
    VoidCallback? onTap,
    double hMargin = dp0,
    int maxLines = 1,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double? width,
    TextAlign textAlign = TextAlign.start,
    double fontSize = dp16,
    TextDecoration? decoration}) {
  var colorL = color ?? Get.theme.primaryColor;
  var widthL = width;
  return Container(
    width: widthL,
    //color: Colors.red,
    margin: EdgeInsets.only(left: hMargin, right: hMargin),
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        minFontSize: dp12,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: Get.textTheme.headline5!.copyWith(
            color: colorL,
            fontWeight: FontWeight.bold,
            fontSize: dp16,
            decoration: decoration),
      ),
      onTap: onTap,
    ),
  );
}

Widget textAutoSizeBold16(
    {required String text,
    VoidCallback? onTap,
    double hMargin = dp0,
    int maxLines = 1,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double? width,
    TextAlign textAlign = TextAlign.start,
    double fontSize = dp16,
    TextDecoration? decoration}) {
  var colorL = color ?? Get.theme.primaryColorDark;
  var widthL = width;
  return Container(
    width: widthL,
    //color: Colors.red,
    margin: EdgeInsets.only(left: hMargin, right: hMargin),
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        minFontSize: dp12,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: Get.textTheme.headline5!.copyWith(
            color: colorL,
            fontWeight: FontWeight.bold,
            fontSize: dp16,
            decoration: decoration),
      ),
      onTap: onTap,
    ),
  );
}

Widget textBodyBold14(
    {required String text,
    int? maxLines,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Alignment alignment = Alignment.centerLeft}) {
  return Container(
    alignment: alignment,
    margin: const EdgeInsets.only(left: dp0, right: dp0),
    child: AutoSizeText(
      text,
      presetFontSizes: const [14, 12, 10],
      maxLines: maxLines,
      style: Get.theme.textTheme.bodyText2,
      textAlign: textAlign,
      textDirection: textDirection,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget textDecoration(String text,
    {VoidCallback? onTap,
    double hMargin = 10,
    int maxLines = 1,
    Color? color,
    double? width,
    TextDecoration decoration = TextDecoration.underline,
    TextAlign textAlign = TextAlign.end,
    double fontSize = dp12}) {
  var colorL = color ?? Get.theme.primaryColor;
  var widthL = width ?? Get.width;
  return Container(
    margin: EdgeInsets.only(left: hMargin, right: hMargin),
    width: widthL,
    child: InkWell(
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        minFontSize: 10,
        textAlign: textAlign,
        style: Get.textTheme.subtitle1!.copyWith(
            color: colorL, decoration: decoration, fontSize: fontSize),
      ),
      onTap: onTap,
    ),
  );
}

Widget textSpanWithAction(
    BuildContext context, String main, String clickAble, VoidCallback onTap,
    {int maxLines = 1,
    double fontSize = 15,
    TextAlign textAlign = TextAlign.center,
    FontWeight fontWeight = FontWeight.bold}) {
  return AutoSizeText.rich(
    TextSpan(
      text: main,
      style: Get.theme
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: fontSize, fontWeight: fontWeight),
      children: <TextSpan>[
        TextSpan(
            text: clickAble,
            style: Get.theme.textTheme.bodyMedium!.copyWith(
                fontSize: fontSize,
                color: Get.theme.focusColor,
                fontWeight: fontWeight),
            recognizer: TapGestureRecognizer()..onTap = onTap),
      ],
    ),
    maxLines: maxLines,
  );
}

Widget textSpan12(
    {String? title,
    String? subTitle,
    int maxLines = 1,
    Color? color,
    TextAlign textAlign = TextAlign.start}) {
  var colorL = color ?? Get.theme.primaryColor;
  return AutoSizeText.rich(
    TextSpan(
      text: title,
      style: Get.textTheme.subtitle1!
          .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
      children: <TextSpan>[
        TextSpan(
          text: subTitle,
          style: Get.textTheme.subtitle1!.copyWith(
              fontSize: 12, fontWeight: FontWeight.bold, color: colorL),
        ),
      ],
    ),
    maxLines: maxLines,
    textAlign: textAlign,
  );
}

Widget textSpan1214(
    {String? title,
    String? subTitle,
    int maxLines = 1,
    Color? color,
    TextAlign textAlign = TextAlign.start}) {
  var colorL = color ?? Get.theme.colorScheme.secondary;
  return AutoSizeText.rich(
    TextSpan(
      text: title,
      style: Get.textTheme.subtitle1!
          .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
      children: <TextSpan>[
        TextSpan(
          text: subTitle,
          style: Get.textTheme.subtitle1!.copyWith(
              fontSize: 14, fontWeight: FontWeight.bold, color: colorL),
        ),
      ],
    ),
    maxLines: maxLines,
    textAlign: textAlign,
  );
}

Widget textWithCopyButton(BuildContext context, String btnText, String text) {
  return Container(
      margin: const EdgeInsets.all(10),
      decoration: boxDecorationRoundBorder(color: Colors.transparent),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 50,
              alignment: Alignment.center,
              decoration: boxDecorationLeftRound(radius: dp5),
              child: textAutoSize(
                  text: btnText,
                  maxLines: 1,
                  width: 50,
                  textAlign: TextAlign.center, onTap: () {
                copyToClipboard(text);
              })),
          Expanded(
              child: Align(
                  alignment: Alignment.center,
                  child: textAutoSize( text: text, maxLines: 2))),
        ],
      ));
}

Widget textWithBackground(String text, BuildContext context,
    {double? width,
    double? height,
    int maxLines = 4,
    Color bgColor = Colors.green,
    Color? textColor}) {
  Color textColorL = textColor ?? Get.theme.primaryColorDark;
  return Container(
    padding: const EdgeInsets.all(dp5),
    alignment: Alignment.center,
    width: width,
    height: height,
    decoration: boxDecorationRoundCorner(color: bgColor),
    child: textAutoSize(
        text: text, color: textColorL, maxLines: maxLines, fontSize: dp10),
  );
}

// marquee_text: ^2.5.0
// Widget textMarquee() {
//   return Container(
//     color: Get.theme.primaryColorDark,
//     height: dp30,
//     alignment: Alignment.center,
//     child: MarqueeText(
//       text: TextSpan(
//         text: "EUR/USD 1.21340 +0.00163 (+0.13%)",
//         style: Get.textTheme.subtitle1!.copyWith(fontSize: 12),
//         children: <TextSpan>[
//           TextSpan(
//             text: " BTC/USD 46891.20 −1771.30 (−3.64%)",
//             style: Get.textTheme.subtitle1!.copyWith(fontSize: 12, color: Get.theme.colorScheme.secondary),
//           ),
//         ],
//       ),
//       speed: 10,
//       alwaysScroll: true,
//       textAlign: TextAlign.center,
//     ),
//   );
// }
