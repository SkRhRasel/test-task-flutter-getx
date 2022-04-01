import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../data/local/constants.dart';
import 'dimens.dart';

Widget textFieldWithSuffixIcon(BuildContext context,
    {Widget? countryPick,
    TextEditingController? controller,
    String? hint,
    String? text,
    String? labelText,
    TextInputType? type,
    String? iconPath,
    VoidCallback? iconAction,
    bool isObscure = false,
    bool isEnable = true,
    int maxLines = 1,
    double? width,
    double? borderRadius = 5,
    Function(String)? onTextChange}) {
  if (controller != null && text != null && text.isNotEmpty) {
    controller.text = text;
  }
  return Container(
      height: dp50,
      width: width,
      padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
      child: TextField(
        controller: controller,
        keyboardType: type,
        maxLines: maxLines,
        cursorColor: Theme.of(context).focusColor,
        obscureText: isObscure,
        enabled: isEnable,
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: (value) {
          if (onTextChange != null) {
            onTextChange(value);
          }
        },
        decoration: InputDecoration(
            prefixIcon: countryPick,
            prefixStyle: Theme.of(context).textTheme.bodyMedium,
            labelText: labelText,
            filled: false,
            isDense: true,
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            enabledBorder:
                _textFieldBorder(context, borderRadius: borderRadius!),
            disabledBorder:
                _textFieldBorder(context, borderRadius: borderRadius),
            focusedBorder: _textFieldBorder(context,
                isFocus: true, borderRadius: borderRadius),
            suffixIcon: iconPath == null
                ? null
                : _buildTextFieldIcon(
                    iconPath: iconPath,
                    action: iconAction,
                    color: Theme.of(context).primaryColorLight,
                    size: Dimens.iconHeightSmall)),
      ));
}

Widget textField(BuildContext context,
    {Widget? countryPick,
    TextEditingController? controller,
    String? hint,
    String? text,
    String? labelText,
    TextInputType? type,
    String? iconPath,
    VoidCallback? iconAction,
    Color? fillColor,
    bool isObscure = false,
    bool isEnable = true,
    int maxLines = 1,
    bool? borderEnable = true,
    bool? curveBorder = false,
    double? width,
    Function(String)? onTextChange}) {
  if (controller != null && text != null && text.isNotEmpty) {
    controller.text = text;
  }
  return Container(
      height: 40,
      width: width,
      margin: const EdgeInsets.only(left: 0, right: 0, top: 0,bottom: 0),
      child: TextField(
        controller: controller,
        keyboardType: type,
        maxLines: maxLines,
        cursorColor: Theme.of(context).focusColor,
        obscureText: isObscure,
        enabled: isEnable,
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: (value) {
          if (onTextChange != null) {
            onTextChange(value);
          }
        },
        decoration: InputDecoration(
            fillColor: fillColor,
            prefixIcon: countryPick,
            prefixStyle: Theme.of(context).textTheme.bodyMedium,
            labelText: labelText,
            filled: true,
            isDense: true,
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            enabledBorder: borderEnable == true
                ? _textFieldBorder(context)
                : _textFieldTransparentBorder(context),
            disabledBorder: borderEnable == true
                ? _textFieldBorder(context)
                : _textFieldTransparentBorder(context),
            focusedBorder: borderEnable == true
                ? _textFieldBorder(context, isFocus: true)
                : _textFieldTransparentBorder(context, isFocus: true),
            suffixIcon: iconPath == null
                ? null
                : _buildTextFieldIcon(
                    iconPath: iconPath,
                    action: iconAction,
                    color: Theme.of(context).primaryColorLight,
                    size: Dimens.iconHeightSmall)),
      ));
}

// Widget textFieldWithoutBorder(BuildContext context,
//     {Widget? countryPick,
//     TextEditingController? controller,
//     String? hint,
//     String? text,
//     String? labelText,
//     TextInputType? type,
//     String? iconPath,
//     VoidCallback? iconAction,
//     bool isObscure = false,
//     bool isEnable = true,
//     int maxLines = 1,
//     double? width,
//     Function(String)? onTextChange}) {
//   if (controller != null && text != null && text.isNotEmpty) {
//     controller.text = text;
//   }
//   return Container(
//       height: 40,
//       width: width,
//       padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
//       child: TextField(
//         controller: controller,
//         keyboardType: type,
//         maxLines: maxLines,
//         cursorColor: Theme.of(context).focusColor,
//         obscureText: isObscure,
//         enabled: isEnable,
//         style: Theme.of(context).textTheme.bodyMedium,
//         onChanged: (value) {
//           if (onTextChange != null) {
//             onTextChange(value);
//           }
//         },
//         decoration: InputDecoration(
//             prefixIcon: countryPick,
//             prefixStyle: Theme.of(context).textTheme.bodyMedium,
//             labelText: labelText,
//             filled: false,
//             isDense: true,
//             hintText: hint,
//             border: InputBorder.none,
//             hintStyle: Theme.of(context).textTheme.bodyMedium,
//             enabledBorder: _textFieldBorder(context),
//             disabledBorder: _textFieldBorder(context),
//             focusedBorder: _textFieldBorder(context, isFocus: true),
//             suffixIcon: iconPath == null
//                 ? null
//                 : _buildTextFieldIcon(
//                     iconPath: iconPath,
//                     action: iconAction,
//                     color: Theme.of(context).primaryColorLight,
//                     size: Dimens.iconHeightSmall)),
//       ));
// }

Widget textFieldBorderedWithSuffixIcon(BuildContext context,
    TextEditingController? controller, String hint, TextInputType type,
    {String? iconPath,
    VoidCallback? iconAction,
    bool isObscure = false,
    bool isEnable = true,
    int maxLines = 1,
    Function(String)? onTextChange}) {
  return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: TextField(
        controller: controller,
        keyboardType: type,
        maxLines: maxLines,
        cursorColor: Get.theme.colorScheme.secondary,
        obscureText: isObscure,
        enabled: isEnable,
        onChanged: (value) {
          if (onTextChange != null) {
            onTextChange(value);
          }
        },
        decoration: InputDecoration(
            filled: false,
            isDense: true,
            hintText: hint,
            hintStyle: Get.textTheme.bodyText1!
                .copyWith(color: Get.theme.primaryColorDark, fontSize: 12),
            enabledBorder: _textFieldBorder(context),
            disabledBorder: _textFieldBorder(context),
            focusedBorder: _textFieldBorder(context, isFocus: true),
            suffixIcon: iconPath == null
                ? null
                : _buildTextFieldIcon(
                    iconPath: iconPath,
                    action: iconAction,
                    color: Theme.of(context).primaryColorDark,
                    size: Dimens.iconHeightSmall)),
      ));
}

Widget textFieldBordered(BuildContext context,
    {TextEditingController? controller,
    String? hint,
    double? width,
    String? text,
    bool enabled = true,
    TextInputType inputType = TextInputType.text,
    List<TextInputFormatter>? inputFormatter}) {
  if (controller != null && text != null && text.isNotEmpty) {
    controller.text = text;
  }
  return Container(
      height: dp50,
      width: width,
      child: TextField(
        controller: controller,
        enabled: enabled,
        keyboardType: inputType,
        inputFormatters: inputFormatter,
        style: Get.theme.textTheme.headline5!
            .copyWith(fontSize: dp15, fontWeight: FontWeight.bold),
        maxLines: 1,
        cursorColor: Get.theme.primaryColorDark,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: Theme.of(context).primaryColor,
          hintText: hint,
          hintStyle: Get.theme.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.normal),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).shadowColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).shadowColor),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(dp7)),
              borderSide: BorderSide(color: Get.theme.colorScheme.secondary)),
        ),
      ));
}

Widget textFieldAddress(
    {TextEditingController? controller,
    String? hint,
    double? width,
    String? text,
    bool enabled = true,
    TextInputType inputType = TextInputType.text,
    List<TextInputFormatter>? inputFormatter}) {
  if (controller != null && text != null && text.isNotEmpty) {
    controller.text = text;
  }
  return SizedBox(
      //height: dp50,
      width: width,
      child: TextField(
        controller: controller,
        enabled: enabled,
        keyboardType: inputType,
        inputFormatters: inputFormatter,
        style: Get.theme.textTheme.headline5!
            .copyWith(fontSize: dp12, fontWeight: FontWeight.normal),
        maxLines: 1,
        cursorColor: Get.theme.primaryColorDark,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          filled: true,
          isDense: true,
          fillColor: Get.theme.primaryColorLight,
          hintText: hint,
          hintStyle: Get.theme.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.normal),
        ),
      ));
}

Widget textFieldBorderedMain(
    {TextEditingController? controller,
    required String text,
    String? hintText,
    double? width,
    TextInputType? textInputType,
    bool viewEnabled = true}) {
  if (controller != null && text != null && text.isNotEmpty) {
    controller.text = text;
  }
  return SizedBox(
      height: dp50,
      //margin: EdgeInsets.all(10),
      width: width,
      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        enabled: viewEnabled,
        style: Get.theme.textTheme.bodyText2,
        maxLines: 1,
        cursorColor: Get.theme.primaryColorLight,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: Get.theme.primaryColor.withOpacity(0.03),
          hintText: hintText,
          hintStyle: Get.theme.textTheme.subtitle2,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Get.theme.dividerColor),
              borderRadius: BorderRadius.all(Radius.circular(dp5))),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Get.theme.dividerColor),
              borderRadius: BorderRadius.all(Radius.circular(dp5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(dp5)),
              borderSide: BorderSide(color: Get.theme.focusColor)),
        ),
      ));
}

Widget textFieldBorderedBackGround(
    BuildContext context, TextEditingController? controller, String hint,
    {double? width, bool enabled = true, Color borderColor = kBorderColor}) {
  return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      width: width,
      height: 55,
      child: TextField(
        controller: controller,
        enabled: enabled,
        maxLines: 1,
        cursorColor: Get.theme.colorScheme.secondary,
        keyboardType: TextInputType.text,
        style: Get.textTheme.bodyText1!
            .copyWith(color: Colors.black, fontSize: 14),
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: Get.theme.primaryColor,
          hintText: hint,
          hintStyle: Get.textTheme.bodyText1!
              .copyWith(color: Get.theme.primaryColorDark, fontSize: 12),
          enabledBorder: _textFieldBorder(context, borderRadius: 10),
          disabledBorder: _textFieldBorder(context, borderRadius: 10),
          focusedBorder:
              _textFieldBorder(context, isFocus: true, borderRadius: 10),
        ),
      ));
}

_textFieldBorder(BuildContext context,
    {bool isFocus = false, double borderRadius = 5}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    borderSide: BorderSide(
        width: 1,
        color: isFocus
            ? Theme.of(context).focusColor
            : Theme.of(context).dividerColor),
  );
}

_textFieldTransparentBorder(BuildContext context,
    {bool isFocus = false, double borderRadius = 12}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    borderSide: BorderSide(
        width: 1,
        color: isFocus ? Theme.of(context).focusColor : Colors.transparent),
  );
}

_textFieldBorderUnderline(BuildContext context,
    {bool isFocus = false, double borderRadius = 5}) {
  return UnderlineInputBorder(
    //borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    borderSide: BorderSide(
        width: 0.25,
        color: isFocus
            ? Theme.of(context).focusColor
            : Theme.of(context).dividerColor),
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

// Widget textFieldBottomLine(TextEditingController controller, String hint,
//     {double width, bool enabled = true, TextInputType inputType = TextInputType.text,
//       TextAlign textAlign: TextAlign.left, Color cursorColor, Color borderColor = dividerColor3, bool autoFocus = true }) {
//   var _cursorColor = cursorColor;
//   if (_cursorColor == null) {
//     _cursorColor = Get.theme.accentColor;
//   }
//   return Container(
//       height: dp50,
//       width: width,
//       child: TextField(
//         controller: controller,
//         enabled: enabled,
//         style: Get.theme.textTheme.headline2,
//         cursorColor: _cursorColor,
//         textAlign: textAlign,
//         maxLines: 1,
//         keyboardType: inputType,
//         autofocus: autoFocus,
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: Get.theme.textTheme.headline2
//               .copyWith(color: subText),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: borderColor),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Get.theme.accentColor),
//           ),
//           border: UnderlineInputBorder(
//             borderSide: BorderSide(color: borderColor),
//           ),
//         ),
//       ));
// }
//
// Widget textFieldBordered(context,TextEditingController controller, String hint,
//     {double width, bool enabled = true, Color borderColor = greyBorder}) {
//   return Container(
//       height: dp50,
//       margin: EdgeInsets.all(10),
//       width: width,
//       child: TextField(
//         controller: controller,
//         enabled: enabled,
//         style: Get.theme.textTheme.headline3,
//         maxLines: 1,
//         cursorColor: Get.theme.primaryColorDark,
//         decoration: InputDecoration(
//           filled: true,
//           isDense: true,
//           fillColor: textFieldColor,
//           hintText: hint,
//           hintStyle: Get.theme.textTheme.subtitle1
//               .copyWith(color: black, fontSize: 18),
//           enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: borderColor),
//               borderRadius: BorderRadius.all(Radius.circular(dp7))),
//           border: OutlineInputBorder(
//               borderSide: BorderSide(color: borderColor),
//               borderRadius: BorderRadius.all(Radius.circular(dp7))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(dp7)),
//               borderSide: BorderSide(color: accentBlue)),
//         ),
//       ));
// }
//
// Widget textFieldBorderedWithPrefixIcon(
//     TextEditingController controller, String hint,
//     {String iconPath, VoidCallback iconAction, bool isObscure = false}) {
//   return Container(
//     //height: 44,
//       margin: EdgeInsets.all(10),
//       child: TextField(
//         controller: controller,
//         obscureText: isObscure,
//         style: Get.theme.textTheme.headline3,
//         maxLines: 1,
//         cursorColor: Get.theme.primaryColorDark,
//         decoration: InputDecoration(
//             filled: true,
//             isDense: true,
//             fillColor: Get.theme.primaryColor,
//             hintText: hint,
//             hintStyle: Get.theme.textTheme.subtitle1,
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(dp7))),
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(
//                   dp10,
//                 )),
//                 borderSide: BorderSide(color: Get.theme.accentColor)),
//             prefixIcon: iconPath == null
//                 ? Container(
//               width: dp0,
//               height: dp0,
//             )
//                 : buildTextFieldIcon(
//                 iconPath, iconAction, Get.theme.primaryColorDark)),
//       ));
// }
//

// Widget textFormFieldDatePicker(BuildContext context,
//     TextEditingController controller, String hint, TextInputType type,
//     {String iconPath, VoidCallback iconAction}) {
//   return Container(
//       padding: EdgeInsets.all(10),
//       child: TextFormField(
//         controller: controller,
//         style: Get.theme.textTheme.headline3,
//         keyboardType: type,
//         maxLines: 1,
//         cursorColor: Get.theme.primaryColorDark,
//         decoration: InputDecoration(
//             filled: true,
//             isDense: true,
//             labelText: hint,
//             //labelText: hint != null ? '$hint${true ? '*' : ''}' : null,
//             labelStyle: Get.theme.textTheme.subtitle1.copyWith(color: black),
//             fillColor: Get.theme.primaryColor,
//             hintText: hint,
//             hintStyle: Get.theme.textTheme.subtitle1.copyWith(color: subText),
//             enabledBorder: textFieldBorder(),
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(dp7)),
//                 borderSide: BorderSide(color: textFieldFocusedBlue)),
//             suffixIcon: iconPath == null
//                 ? Container(
//                     width: dp0,
//                     height: dp0,
//                   )
//                 : buildTextFieldIcon(
//                     iconPath, iconAction, Get.theme.primaryColorDark)),
//         onTap: () async {
//           DateTime date = DateTime(1900);
//           FocusScope.of(context).requestFocus(new FocusNode());
//
//           date = await showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime(1900),
//               lastDate: DateTime.now());
//           controller.text = formatDateItem(date);
//         },
//       ));
// }
//
// Widget textFieldBorderedWithPrefixAndSuffixIcon(TextEditingController controller, String hint,
//     String prefixIcon, VoidCallback prefixAction, String suffixIcon,
//     VoidCallback suffixAction, {TextInputType type, bool enable = true}) {
//   return Container(
//       padding: EdgeInsets.all(dp10),
//       child: TextField(
//           controller: controller,
//           style: Get.theme.textTheme.headline4,
//           keyboardType: type,
//           maxLines: 1,
//           enabled: enable,
//           cursorColor: Get.theme.primaryColorDark,
//           decoration: InputDecoration(
//             filled: true,
//             isDense: true,
//             labelText: hint,
//             labelStyle: Get.theme.textTheme.subtitle1.copyWith(
//                 color: black, fontSize: 20, fontWeight: FontWeight.w500),
//             fillColor: textFieldColor,
//             hintText: hint,
//             hintStyle: Get.theme.textTheme.subtitle1.copyWith(
//                 color: subText,
//                 fontSize: 20,
//                 fontWeight: FontWeight.normal),
//             enabledBorder: textFieldBorderSearch(),
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(dp7)),
//                 borderSide: BorderSide(color: accentBlue)),
//             prefixIcon: buttonOnlyIcon(null, prefixAction, iconPath: prefixIcon),
//             suffixIcon: buttonOnlyIcon(null, suffixAction, iconPath: suffixIcon)
//           )));
// }
//
// /// *** Helper Methods *** ///
// textFieldBorder({bool isError = false}) {
//   return OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(dp7)),
//     borderSide: BorderSide(
//         width: 1, color: isError ? Colors.red : Get.theme.accentColor),
//   );
// }
//
// textFieldBorderSearch({bool isError = false}) {
//   return OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(dp7)),
//     borderSide: BorderSide(width: 1, color: isError ? Colors.red : greyBorder),
//   );
// }
//
// Widget buildTextFieldIcon(String iconPath, VoidCallback action, Color color) {
//   return InkWell(
//     onTap: action,
//     child: Padding(
//         padding: EdgeInsets.all(dp15),
//         child: SvgPicture.asset(
//           iconPath,
//           color: color,
//         )),
//   );
// }
//
// Widget buildTextFieldIconLeftDot(String iconPath, Color color) {
//   return Padding(
//       padding: EdgeInsets.all(dp3),
//       child: SvgPicture.asset(
//         iconPath,
//         color: color,
//       ));
// }
