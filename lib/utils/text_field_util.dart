import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_task_flutter_getx/utils/decorations.dart';
import '../data/local/constants.dart';
import 'dimens.dart';

Widget textFieldWithPrefixIcon(BuildContext context,
    {Widget? countryPick,
    TextEditingController? controller,
    String? hint,
    String? text,
    String? labelText,
    TextInputType? type,
    String? prefixIconIconPath,
    VoidCallback? prefixIconIconAction,
    String? suffixIconPath,
    VoidCallback? suffixIconAction,
    bool isObscure = false,
    bool isEnable = true,
    int maxLines = 1,
    double? width,
    double? borderRadius = 5,
    Color? bgColor,
    Function(String)? onTextChange}) {
  if (controller != null && text != null && text.isNotEmpty) {
    controller.text = text;
  }
  return Container(
      height: dp50,
      width: width,
      padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
      decoration: getRoundSoftTransparentBox(),
      child: TextField(
        controller: controller,
        keyboardType: type,
        maxLines: maxLines,
        cursorColor: Get.theme.primaryColorDark,
        obscureText: isObscure,
        enabled: isEnable,
        style: Get.theme.textTheme.bodyMedium,
        onChanged: (value) {
          if (onTextChange != null) {
            onTextChange(value);
          }
        },
        decoration: InputDecoration(
            fillColor: bgColor,
            prefixIcon: prefixIconIconPath == null
                ? null
                : _buildTextFieldIcon(
                    iconPath: prefixIconIconPath,
                    action: prefixIconIconAction,
                    color: Get.theme.primaryColorLight,
                    size: Dimens.iconHeightSmall),
            prefixStyle: Get.theme.textTheme.bodyMedium,
            labelText: labelText,
            filled: true,
            isDense: true,
            hintText: hint,
            hintStyle: Get.theme.textTheme.bodyMedium,
            enabledBorder:
                _textFieldRounded(context, borderRadius: borderRadius!),
            disabledBorder:
                _textFieldRounded(context, borderRadius: borderRadius),
            focusedBorder: _textFieldBorder(context,
                isFocus: true, borderRadius: borderRadius),
            suffixIcon: suffixIconPath == null
                ? null
                : _buildTextFieldIcon(
                    iconPath: suffixIconPath,
                    action: suffixIconAction,
                    color: Get.theme.primaryColorLight,
                    size: Dimens.iconHeightSmall)),
      ));
}

_textFieldBorder(BuildContext context,
    {bool isFocus = false, double borderRadius = 5}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    borderSide: BorderSide(
        width: 1,
        color:
            isFocus ? Get.theme.colorScheme.secondary : Get.theme.dividerColor),
  );
}

_textFieldRounded(BuildContext context,
    {bool isFocus = false, double borderRadius = 50}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    borderSide: BorderSide(
        width: 1, color: isFocus ? Get.theme.focusColor : Colors.transparent),
  );
}

Widget _buildTextFieldIcon(
    {String? iconPath, VoidCallback? action, Color? color, double? size}) {
  return InkWell(
    onTap: action,
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SvgPicture.asset(
          iconPath!,
          color: color,
          height: size,
          width: size,
        )),
  );
}
