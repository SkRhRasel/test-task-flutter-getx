import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task_flutter_getx/utils/text_util.dart';
import 'package:get/get.dart';
import '../data/local/constants.dart';
import 'button_util.dart';
import 'common_utils.dart';
import 'decorations.dart';
import 'dimens.dart';

// Widget buildSearchBox() {
//   return Container(
//       margin:
//       const EdgeInsets.only(left: dp0, top: dp10, right: dp0, bottom: dp10),
//       height: kToolbarHeight,
//       child: InkWell(
//         onTap: () {
//           Get.to(() => const SearchPage());
//         },
//         child: TextField(
//           enabled: false,
//           decoration: decorationSearchBox(),
//         ),
//       ));
// }

Widget listTitleWithLeftIcon(BuildContext context,
    {String? title,
    String? iconPath,
    Color? color,
    VoidCallback? action,
    Color? iconColor}) {
  return SizedBox(
    //height: dp50,
    child: InkWell(
      onTap: action,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buttonOnlyIcon2(
              onPressCallback: action,
              iconPath: iconPath!,
              size: 18,
              iconColor: iconColor),
          textAutoSize( text: title!, maxLines: 1),
        ],
      ),
    ),
  );
}

Widget listTitleWithArrow(BuildContext context,
    {String? title, String? iconPath, VoidCallback? action}) {
  return SizedBox(
    height: 45,
    //color: Colors.blue,
    child: InkWell(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          children: [
            Expanded(
                child: textAutoSize(
                    text: title!, fontWeight: FontWeight.w600, fontSize: 14)),
            buttonOnlyIcon(
                onPressCallback: action,
                iconPath: iconPath!,
                size: 20,
                iconColor: Get.theme.primaryColor)
          ],
        ),
      ),
    ),
  );
}

Widget listTitle(String title, String buttonTitle, VoidCallback action) {
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 2),
    height: 50,
    child: Row(
      children: [
        Expanded(child: textAutoSize(text: title)),
        buttonText(buttonTitle, action)
      ],
    ),
  );
}

Widget horizontalDivider({Color color = kBorderColor, double margin = 0}) {
  return Container(
    margin: EdgeInsets.only(left: margin, right: margin),
    child: Divider(
      height: 1,
      color: color,
      thickness: 1,
    ),
  );
}

Widget verticalDivider({Color color = kBorderColor, double padding = 0}) {
  return Container(
    width: 1,
    padding: EdgeInsets.only(left: padding, right: padding),
    child: Divider(
      height: 48,
      color: color,
      thickness: 48,
    ),
  );
}

Widget showEmptyView() {
  return SizedBox(
    height: Get.width,
    child: Center(
      child: textAutoSize(text: "Data not found".tr),
    ),
  );
}

Widget handleEmptyViewWithLoading(bool isLoading,
    {double height = 50, String? message}) {
  String _message = message ?? "Sorry! Data not found".tr;
  return Container(
      margin: const EdgeInsets.all(20),
      height: height,
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : textAutoSize(
                text: _message,
                maxLines: 2,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.center,
              ),
      ));
}

Widget viewTitleWithSubTitleText(BuildContext context,
    {String? title, String? subTitle, int? maxLines = 2}) {
  return SizedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: Dimens.gapLarge),
        textAutoSize(
            text: stringNullCheck(title),
            textAlign: TextAlign.center,
            fontSize: 24,
            color: Get.theme.primaryColorDark,
            fontWeight: FontWeight.bold),
        const SizedBox(height: Dimens.gapMin),
        textAutoSize(
            text: stringNullCheck(subTitle),
            textAlign: TextAlign.center,
            color: Get.theme.primaryColorLight,
            maxLines: maxLines!),
        const SizedBox(height: Dimens.gapMid),
      ],
    ),
  );
}

Widget viewTitleWithTwoSubTitleText(BuildContext context,
    {String? title,
    String? subTitle,
    String? subColorTitle,
    int maxLines = 2}) {
  return SizedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textAutoSize(
            text: stringNullCheck(title),
            textAlign: TextAlign.center,
            fontSize: 24,
            color: Get.theme.primaryColorDark,
            fontWeight: FontWeight.bold),
        const SizedBox(height: Dimens.gapExtraMin),
        textAutoSize(
            text: stringNullCheck(subTitle),
            textAlign: TextAlign.center,
            color: Get.theme.primaryColorLight,
            maxLines: maxLines),
        textAutoSize(
            text: stringNullCheck(subColorTitle),
            textAlign: TextAlign.center,
            color: Get.theme.colorScheme.secondary,
            maxLines: maxLines),
        const SizedBox(height: Dimens.gapMid),
      ],
    ),
  );
}

Widget notificationItem() {
  return Container(
    decoration: decorationRoundCornerBox(color: Get.theme.primaryColor),
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(vertical: 10),
    height: 100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buttonOnlyIconWithRoundBackground(
            AssetConstants.icNotification, false, () {}),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width - 150,
              child: textAutoSize(
                text: "Notification Headline",
              ),
            ),
            textAutoSize(text: "20 June, 2021 , 2:30 PM"),
          ],
        )
      ],
    ),
  );
}

Widget buttonOnlyIconWithRoundBackground(
    String iconPath, bool isSelected, VoidCallback onPressCallback) {
  return MaterialButton(
    onPressed: onPressCallback,
    color: isSelected
        ? Get.theme.colorScheme.secondary
        : Get.theme.secondaryHeaderColor.withOpacity(.2),
    height: 50,
    elevation: 0,
    child: SvgPicture.asset(iconPath),
    // Image.asset(
    //   iconPath,
    //   width: dp50,
    //   height: dp50,
    //   color: Get.theme.accentColor,
    // ),
    padding: const EdgeInsets.all(5),
    shape: const CircleBorder(),
  );
}

// Widget getCountry(BuildContext context,
//     {double? width, String? initialValue, ValueChanged<String>? onChanged}) {
//   String initialSelection = DefaultValue.country;
//   if (initialValue != null && initialValue.isNotEmpty) {
//     initialSelection = initialValue;
//   }
//
//   return SizedBox(
//     width: 135,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         CountryCodePicker(
//           showFlag: true,
//           padding: const EdgeInsets.all(0),
//           showCountryOnly: false,
//           initialSelection: initialSelection,
//           textStyle: Get.theme.textTheme.bodyMedium,
//           showOnlyCountryWhenClosed: false,
//           onInit: (value) {},
//           onChanged: (value) {
//             onChanged!(value.name!);
//           },
//         ),
//         Icon(
//           Icons.keyboard_arrow_down,
//           size: dp20,
//           color: Get.theme.primaryColorLight,
//         ),
//         verticalDivider(color: Get.theme.dividerColor, padding: 0)
//       ],
//     ),
//   );
// }



Widget dropDownList(BuildContext context, List<String> items,
    String selectedValue, String hint, Function(String value) onChange,
    {double? width}) {
  double widthL = width ?? Get.width - 80;
  return Container(
    margin: const EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
    padding: const EdgeInsets.only(left: 15, top: 0, right: 5, bottom: 0),
    //padding: const EdgeInsets.symmetric(horizontal: 10),
    height: Dimens.btnHeightMain,
    width: Get.width,
    decoration: boxDecorationRoundBorder(
        color: Get.theme.primaryColor,
        borderColor: Get.theme.primaryColorLight),
    child: DropdownButton<String>(
      isExpanded: true,
      value: selectedValue.isEmpty ? null : selectedValue,
      hint: textAutoSizePoppins(context,
          text: hint,
          fontSize: 12,
          color: Get.theme.primaryColorLight,
          width: widthL),
      icon: const Icon(Icons.keyboard_arrow_down_outlined,
          color: kMainTextGrayColor),
      elevation: 10,
      dropdownColor: Get.theme.dividerColor,
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      style: Get.textTheme.bodyMedium,
      underline: Container(height: 0, color: Colors.transparent),
      menuMaxHeight: Get.height - 200,
      onChanged: (value) {
        onChange(value!);
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: textAutoSizePoppins(context,
              text: value,
              fontSize: 12,
              color: Get.theme.primaryColorLight,
              width: widthL),
        );
      }).toList(),
    ),
  );
}

Widget dropDownListForProfile(BuildContext context, List<String> items,
    String selectedValue, String hint, Function(String value) onChange,
    {double? width,
    Color? bgColor,
    Color? borderColor,
    double? height,
    double? padding,
    double? hintFontSize,
    double? iconSize,
    bool? caretFilled = false,
    bool? borderCurve = true}) {
  bgColor = bgColor ?? Get.theme.primaryColor;
  borderColor = borderColor ?? Get.theme.dividerColor;
  padding = padding ?? Dimens.marginMax;
  height = height ?? Dimens.btnHeightMain;
  iconSize = iconSize ?? Dimens.iconSize;
  hintFontSize = hintFontSize ?? Dimens.regularFontSizeMid;
  // double widthL = width ?? Get.width - 80;
  return Container(
    // margin: const EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
    padding: EdgeInsets.only(left: padding, top: 0, right: padding, bottom: 0),
    //padding: const EdgeInsets.symmetric(horizontal: 10),
    height: height,
    width: Get.width,
    decoration: borderCurve == true
        ? boxDecorationRoundBorder(
            color: bgColor,
            borderColor: borderColor,
            radius: Dimens.borderRadiusLarge)
        : boxDecorationRoundBorder(
            color: bgColor,
            borderColor: borderColor,
            radius: Dimens.borderRadius),
    child: DropdownButton<String>(
      isExpanded: true,
      value: selectedValue.isEmpty ? null : selectedValue,
      hint: textAutoSizePoppins(context,
          fontSize: hintFontSize,
          text: hint,
          color: Get.theme.primaryColorLight),
      icon: Align(
          alignment: Alignment.centerRight,
          child: caretFilled == false
              ? const Icon(Icons.keyboard_arrow_down_sharp,
                  color: kDropdownBtnColor, size: 24)
              : const Icon(Icons.arrow_drop_down,
                  color: kDropdownBtnColor, size: 18)),
      elevation: 10,
      dropdownColor: Get.theme.dividerColor,
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      style: Get.textTheme.bodySmall!.copyWith(fontSize: 14),
      underline: Container(height: 0, color: Colors.transparent),
      menuMaxHeight: Get.height - 200,
      onChanged: (value) {
        onChange(value!);
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: textAutoSizePoppins(context,
              text: value, color: Get.theme.primaryColorLight),
        );
      }).toList(),
    ),
  );
}
Widget dropDownListMain(BuildContext context, List<String> items,
    String selectedValue, String hint, Function(String value) onChange,
    {double? width,
    Color? bgColor,
    Color? borderColor,
    double? height,
    double? padding,
    double? hintFontSize,
    double? iconSize,
    bool? caretFilled = false,
    bool? borderCurve = true}) {
  bgColor = bgColor ?? Get.theme.primaryColor;
  borderColor = borderColor ?? Get.theme.dividerColor;
  padding = padding ?? Dimens.marginMax;
  height = height ?? Dimens.btnHeightMain;
  iconSize = iconSize ?? Dimens.iconSize;
  hintFontSize = hintFontSize ?? Dimens.regularFontSizeMid;
  // double widthL = width ?? Get.width - 80;
  return Container(
    // margin: const EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
    padding: EdgeInsets.only(left: padding, top: 0, right: padding, bottom: 0),
    //padding: const EdgeInsets.symmetric(horizontal: 10),
    height: height,
    width: Get.width,
    decoration: borderCurve == true
        ? boxDecorationRoundBorder(
            color: bgColor,
            borderColor: borderColor,
            radius: Dimens.borderRadiusLarge)
        : boxDecorationRoundBorder(
            color: bgColor,
            borderColor: borderColor,
            radius: Dimens.borderRadius),
    child: DropdownButton<String>(
      isExpanded: true,
      value: selectedValue.isEmpty ? null : selectedValue,
      hint: textAutoSizePoppins(context,
          fontSize: hintFontSize,
          text: hint,
          color: Get.theme.primaryColorLight),
      icon: Align(
          alignment: Alignment.centerRight,
          child: caretFilled == false
              ? const Icon(Icons.keyboard_arrow_down_sharp,
                  color: kDropdownBtnColor, size: 24)
              : const Icon(Icons.arrow_drop_down,
                  color: kDropdownBtnColor, size: 18)),
      elevation: 10,
      dropdownColor: Get.theme.dividerColor,
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      style: Get.textTheme.bodySmall!.copyWith(fontSize: 14),
      underline: Container(height: 0, color: Colors.transparent),
      menuMaxHeight: Get.height - 200,
      onChanged: (value) {
        onChange(value!);
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: textAutoSizePoppins(context,
              text: value, color: Get.theme.primaryColorLight),
        );
      }).toList(),
    ),
  );
}



// Widget buildSearchBox() {
//   return Container(
//       margin:
//           const EdgeInsets.only(left: dp0, top: dp10, right: dp0, bottom: dp10),
//       height: 50,
//       child: InkWell(
//         onTap: () {
//           Get.to(() => const SearchPage());
//         },
//         child: TextField(
//           enabled: false,
//           decoration: decorationSearchBox(),
//         ),
//       ));
// }
