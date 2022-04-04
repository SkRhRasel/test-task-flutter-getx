import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import '../data/local/constants.dart';
import 'dimens.dart';

Widget imageView({
  IconData? icon,
  String? imagePath = "",
  double? width,
  double? height,
  VoidCallback? onPressCallback,
  Color? color,
  BoxFit? boxFit = BoxFit.contain,
  double? iconSize,
}) {
  return InkWell(
    onTap: onPressCallback,
    child: imagePath!.isNotEmpty
        ? imagePath.contains(".svg")
            ? SvgPicture.asset(
                imagePath,
                fit: boxFit!,
                width: width,
                height: height,
                color: color,
              )
            : Image.asset(
                imagePath,
                fit: boxFit!,
                width: width,
                height: height,
              )
        : Icon(
            icon!,
            size: iconSize,
            color: color,
          ),
  );
}

imageViewNetwork(
    {IconData? icon,
    String? imagePath,
    double? width,
    double? height,
    VoidCallback? onPressCallback,
    Color? iconColor,
    BoxFit? boxFit = BoxFit.contain,
    double? iconSize}) {
  return InkWell(
    onTap: onPressCallback,
    child: imagePath!.isNotEmpty
        ? imagePath.contains(".svg")
            ? SvgPicture.network(imagePath,
                fit: boxFit!, width: width, height: height, color: iconColor)
            : Image.network(imagePath,
                fit: boxFit!, width: width, height: height)
        : Icon(icon!, size: iconSize, color: iconColor),
  );
}