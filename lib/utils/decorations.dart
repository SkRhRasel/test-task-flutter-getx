import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/local/constants.dart';

getBackgroundImageDecoration({required String imagePath}) {
  return BoxDecoration(
    image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
  );
}

getRoundCornerWithShadow({Color color = kPrimaryColor, double radius = 7}) {
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

getRoundCornerBorderOnlyTop({Color bgColor = kPrimaryColor}) {
  return BoxDecoration(
    // image: DecorationImage(
    //     image: getImage(stringNullCheck(auction.productImageUrl), true),
    //     fit: BoxFit.cover),
    color: bgColor,
    borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
  );
}

decorationRoundCornerBox({Color color = kPrimaryColor}) {
  return BoxDecoration(
      color: color, borderRadius: const BorderRadius.all(Radius.circular(7)));
}

getRoundCornerBorderOnlyBottom() {
  return const BoxDecoration(
    color: kPrimaryColor,
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(7)),
  );
}

getRoundSoftTransparentBox({double radius = 14}) {
  return BoxDecoration(
      color: Get.theme.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

boxDecorationRoundCorner({Color color = kFollowBgColor, double radius = 30}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

boxDecorationRoundBorder(
    {Color color = Colors.transparent,
    Color borderColor = kMainTextGrayColor,
    double radius = 7}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      border: Border.all(color: borderColor, width: 1));
}
