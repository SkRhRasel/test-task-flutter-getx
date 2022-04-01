import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../data/local/constants.dart';
import 'dimens.dart';

const bgAuth = BoxDecoration(
  image: DecorationImage(
      image: AssetImage(AssetConstants.bgAuth), fit: BoxFit.fitWidth),
);

const bgNavDrawer = BoxDecoration(
  image: DecorationImage(
      image: AssetImage(AssetConstants.bgNavHeader), fit: BoxFit.fill),
);

const bgScreen = BoxDecoration(
  image: DecorationImage(
      image: AssetImage(AssetConstants.bgScreen), fit: BoxFit.cover),
);



getBackgroundImageDecoration({required String imagePath}) {
  return BoxDecoration(
    image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
  );
}

// decorationSearchBox({VoidCallback? rightIconAction}) {
//   return InputDecoration(
//     filled: false,
//     hintText: "Search your item".tr,
//     hintStyle: const TextStyle(color: Colors.grey),
//     suffixIcon: InkWell(
//       onTap: rightIconAction,
//       child: Padding(
//           padding: const EdgeInsets.all(dp10),
//           child: SvgPicture.asset(
//             AssetConstants.icSearch,
//             color: Get.theme.primaryColorDark,
//           )),
//     ),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(dp7),
//       borderSide: const BorderSide(
//         width: dp1,
//         style: BorderStyle.solid,
//       ),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
//       borderRadius: BorderRadius.circular(dp7),
//     ),
//   );
// }

getRoundCornerWithShadow({Color color = kPrimaryColor}) {
  return BoxDecoration(
    color: color,
    borderRadius: const BorderRadius.all(Radius.circular(dp7)),
    // borderRadius: BorderRadius.only(
    //   topLeft: Radius.circular(dp15),
    //   topRight: Radius.circular(dp15),
    // ),
    //boxShadow: kElevationToShadow[1]
    boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 1,
          offset: const Offset(1, 1) // Shadow position
          //       // color: Colors.grey.withOpacity(0.8),
          //       // spreadRadius: 10,
          //       // blurRadius: 5,
          //       // offset: Offset(0, 7),
          ),
    ],
  );
}
getShadowWithRadius({Color color = kPrimaryColor, double radius = 7}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 1,
          offset: const Offset(1, 1) // Shadow position
          ),
    ],
  );
}

// getRoundCornerBorderOnlyTop(Auction auction) {
getRoundCornerBorderOnlyTop({Color bgColor = kPrimaryColor}) {
  return BoxDecoration(
    // image: DecorationImage(
    //     image: getImage(stringNullCheck(auction.productImageUrl), true),
    //     fit: BoxFit.cover),
    color: bgColor,
    borderRadius: const BorderRadius.vertical(top: Radius.circular(dp7)),
  );
}

// getRoundCornerBorderOnlyTop({Color bgColor = white, String? imagePath,
//   BoxFit? boxFit = BoxFit.contain, }) {
//   return BoxDecoration(
//     image: DecorationImage(
//       //image: getImage(stringNullCheck(auction.productImageUrl), true),
//         image: imageViewNetwork(imagePath: imagePath), fit: boxFit),
//     color: bgColor,
//     borderRadius: const BorderRadius.vertical(top: Radius.circular(dp7)),
//   );
// }

decorationRoundCornerBox({Color color = kPrimaryColor}) {
  return BoxDecoration(
      color: color, borderRadius: const BorderRadius.all(Radius.circular(dp7)));
}

getRoundCornerBorderOnlyBottom() {
  return const BoxDecoration(
    color: kPrimaryColor,
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(dp7)),
  );
}

getRoundSoftTransparentBox() {
  return BoxDecoration(
      color: Get.theme.primaryColor.withOpacity(0.03),
      borderRadius: const BorderRadius.all(Radius.circular(dp7)));
}

boxDecorationRoundCorner({Color color = kPrimaryColor, double radius = 7}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

boxDecorationRoundBorder({Color color = Colors.transparent, Color borderColor = kMainTextGrayColor, double radius = 7}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      border: Border.all(color: borderColor, width: 1));
}
boxDecorationUnselectedTab({Color borderColor = kMainTextGrayColor, double radius = 15}) {
  return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      border: Border.all(color: borderColor, width: 0.25));
}

boxDecorationTopRound(
    {Color color = kPrimaryDarkColor,
    bool isGradient = false,
    double radius = 7}) {
  return BoxDecoration(
    color: isGradient ? null : color,
    gradient: isGradient ? linearGradient(color) : null,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    ),
  );
}

boxDecoration(
    {Color color = kPrimaryDarkColor,
    bool isGradient = false,
    double radius = 0}) {
  return BoxDecoration(
    color: isGradient ? null : color,
    gradient: isGradient ? linearGradient(color) : null,
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

boxDecorationLeftRound({Color color = kPrimaryDarkColor, double radius = 7}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(radius),
      bottomLeft: Radius.circular(radius),
    ),
  );
}

linearGradient(Color color) {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [color.withOpacity(0.9), color],
  );
}

decorationBottomBorder() {
  return BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Get.theme.secondaryHeaderColor.withOpacity(.5),
        width: dp1,
      ),
    ),
  );
}



decorationSearchBox({VoidCallback? rightIconAction}) {
  return InputDecoration(
    contentPadding:const EdgeInsets.all(dp10),
    filled: false,
    hintText: "Search your item".tr,
    hintStyle: const TextStyle(color: Colors.grey,fontSize: 16),
    suffixIcon: InkWell(
      onTap: rightIconAction,
      child: Padding(
          padding: const EdgeInsets.all(dp10),
          child: SvgPicture.asset(
            AssetConstants.icSearch,
            color: Get.theme.primaryColorLight,
          )),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: dp1,
        style: BorderStyle.solid,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Get.theme.primaryColorLight),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

// final navDrawerBackgroundDecoration = BoxDecoration(
//   image: DecorationImage(
//     image: AssetImage(
//       AssetConstants.splash_bg,
//     ),
//     fit: BoxFit.cover,
//   ),
// );
//
// getRoundedCornerShape({double borderRadius = dp20}) {
//   return RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
//   );
// }
//
// decorationBottomBorder() {
//   return BoxDecoration(
//     border: Border(
//       bottom: BorderSide(
//         //                   <--- left side
//         color: Get.theme.disabledColor,
//         width: dp1,
//       ),
//     ),
//   );
// }
//
// getBoxCornerBox({Color color = kAccentColorOrange}) {
//   return BoxDecoration(
//       //color: color, borderRadius: BorderRadius.all(Radius.circular(dp7))
//
//       border: Border.all(color: color, width: 2));
// }
//
// getRoundTransparentBox() {
//   return BoxDecoration(
//       color: white.withOpacity(0.03),
//       borderRadius: BorderRadius.all(Radius.circular(dp7)));
// }
//
// getTransparentBox() {
//   return BoxDecoration(
//       gradient: new LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [
//           const Color(0xFF202942),
//           const Color(0xFF1B243D),
//           // Color.fromARGB(255, 25,178,238),
//           // Color.fromARGB(255, 21,236,229)
//         ],
//       ),
//       //color: white.withOpacity(0.03),
//       borderRadius: BorderRadius.all(Radius.circular(dp0)));
// }
//
// getTransparentBoxWithGradient() {
//   return BoxDecoration(
//       gradient: new LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [
//           const Color(0xFF202942),
//           const Color(0xFF1B243D),
//           // Color.fromARGB(255, 25,178,238),
//           // Color.fromARGB(255, 21,236,229)
//         ],
//       ),
//       //color: white.withOpacity(0.03),
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(dp7), topRight: Radius.circular(dp7)));
// }
//
// getRoundTransparentBoxWithBorder() {
//   return BoxDecoration(
//       color: white.withOpacity(0.03),
//       border: Border.all(color: kBorder),
//       borderRadius: BorderRadius.all(Radius.circular(dp5)));
// }
//
// getRoundTransparentBoxWithBorderRadius20() {
//   return BoxDecoration(
//       color: white.withOpacity(0.03),
//       border: Border.all(color: kBorder),
//       borderRadius: BorderRadius.all(Radius.circular(dp20)));
// }
//
// getGreyBackground() {
//   return BoxDecoration(
//     color: kGreyColor,
//     // border: Border.all(color: kBorder),
//     // borderRadius: BorderRadius.all(Radius.circular(dp5))
//   );
// }
//
// getRoundCornerBoxWhite({Color color = white}) {
//   return BoxDecoration(
//     color: color,
//     borderRadius: BorderRadius.all(Radius.circular(dp15)),
//     boxShadow: [
//       BoxShadow(
//         color: black.withOpacity(0.3),
//         blurRadius: 5,
//         offset: Offset(0, 4), // Shadow position
//       ),
//     ],
//   );
// }
//
// getRoundCornerBoxWithShadow({Color color}) {
//   return BoxDecoration(
//     color: color,
//     borderRadius: BorderRadius.all(Radius.circular(dp15)),
//     boxShadow: [
//       BoxShadow(
//         color: black.withOpacity(0.3),
//         blurRadius: 5,
//         offset: Offset(0, 4), // Shadow position
//       ),
//     ],
//   );
// }
//
// getRoundGradientCornerBoxWithShadow() {
//   return BoxDecoration(
//     borderRadius: BorderRadius.circular(12.0),
//     gradient: LinearGradient(
//       begin: Alignment(-0.96, 0.57),
//       end: Alignment(1.0, 0.08),
//       colors: [const Color(0xff6ee4ff), const Color(0xffb6f5ff)],
//       stops: [0.0, 1.0],
//     ),
//     boxShadow: [
//       BoxShadow(
//         color: const Color(0xff27ccff),
//         offset: Offset(0, 4),
//         //blurRadius: 5,
//       ),
//     ],
//   );
// }
//
// getRoundCornerBoxWhiteWithoutShadow({Color color}) {
//   return BoxDecoration(
//     color: color,
//     borderRadius: BorderRadius.all(Radius.circular(dp15)),
//   );
// }
//
// getRoundCornerBoxBlack({Color color = black}) {
//   return BoxDecoration(
//     color: color,
//     borderRadius: BorderRadius.all(Radius.circular(dp15)),
//     boxShadow: [
//       BoxShadow(
//         color: black.withOpacity(0.3),
//         blurRadius: 5,
//         offset: Offset(0, 4), // Shadow position
//       ),
//     ],
//   );
// }
//
// getRoundCornerBoxWhiteBottomRadius({Color color = white}) {
//   return BoxDecoration(
//     color: color,
//     borderRadius: BorderRadius.only(
//       bottomLeft: Radius.circular(dp15),
//       bottomRight: Radius.circular(dp15),
//     ),
//     // boxShadow: kElevationToShadow[
//     //     1]
//     boxShadow: [
//       BoxShadow(
//           color: Colors.grey.withOpacity(0.2),
//           spreadRadius: 0,
//           blurRadius: 6,
//           offset: Offset(0, 10) // Shadow position
//           ),
//     ],
//   );
// }
//
// getRoundCornerBoxWhiteTopRadius({Color color = white}) {
//   return BoxDecoration(
//     color: color,
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(dp15),
//       topRight: Radius.circular(dp15),
//     ),
//     // boxShadow: kElevationToShadow[
//     //     1]
//     boxShadow: [
//       BoxShadow(
//           color: Colors.grey.withOpacity(0.2),
//           spreadRadius: 0,
//           blurRadius: 6,
//           offset: Offset(10, 0) // Shadow position
//           // color: Colors.grey.withOpacity(0.8),
//           // spreadRadius: 10,
//           // blurRadius: 5,
//           // offset: Offset(0, 7),
//           ),
//     ],
//   );
// }
//
// getRoundCornerBorder({Color color = kTabBorder}) {
//   return BoxDecoration(
//       border: Border.all(color: color),
//       borderRadius: BorderRadius.all(Radius.circular(dp7)));
// }
//
// getCircleCornerBorder({Color color = kDivider2}) {
//   return BoxDecoration(
//       border: Border.all(color: color),
//       borderRadius: BorderRadius.circular(dp80));
// }
//
// getRoundCornerBorderWithBgColor({Color bgColor}) {
//   return BoxDecoration(
//       color: bgColor, borderRadius: BorderRadius.all(Radius.circular(dp7)));
// }
//
// getRoundCornerWhite() {
//   return BoxDecoration(
//       color: white, borderRadius: BorderRadius.all(Radius.circular(dp50)));
// }
//
// getRoundCornerBorderOnlyTop(Color color) {
//   return BoxDecoration(
//       color: color,
//       borderRadius: BorderRadius.vertical(top: Radius.circular(dp20)));
// }
//
// getRoundCornerBorderOnlyBottom(Color color) {
//   return BoxDecoration(
//       color: color,
//       borderRadius: BorderRadius.vertical(bottom: Radius.circular(dp20)));
// }
//
// getRoundCornerBorderOnlyTop2() {
//   RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(dp20)));
// }
//
// getRoundedRectangleBorderTop(Color color) {
//   RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(dp7), topRight: Radius.circular(dp7)),
//       side: BorderSide(color: color));
// }
//
// getRoundedRectangleBorderBottom(Color color) {
//   RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(dp7),
//           bottomRight: Radius.circular(dp7)),
//       side: BorderSide(color: color));
// }
//
// getCircleBoxWithCenterIcon(String iconPath, {Color color = white}) {
//   return Container(
//     alignment: Alignment.center,
//     width: Get.width / 3,
//     height: Get.width / 3,
//     decoration: BoxDecoration(shape: BoxShape.circle, color: bgCircle,
//         border: Border.all(color: Get.theme.accentColor.withOpacity(0.9), width: dp4,),
//         ),
//     child: Icon(
//
//     ),
//   );
// }
//
// getRectangleBoxWithText(
//   String text, {
//   Color textColor,
//   Color bgColor,
// }) {
//   return Container(
//     alignment: Alignment.center,
//     height: 30,
//     padding: EdgeInsets.all(4),
//     width: Get.width / 4,
//     decoration: BoxDecoration(
//       color: bgColor,
//       shape: BoxShape.rectangle,
//     ),
//     child: Text(
//       text,
//       style: TextStyle(
//         fontFamily: 'Montserrat',
//         fontSize: 22,
//         color: textColor,
//         letterSpacing: 1.3199999999999998,
//         fontWeight: FontWeight.w700,
//         height: 1.2727272727272727,
//       ),
//       textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
//       textAlign: TextAlign.center,
//     ),
//   );
// }
//
// boxDecorationOnlyTop() {
//   return BoxDecoration(
//       color: Get.theme.accentColor,
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(dp50), topRight: Radius.circular(dp50)));
// }
