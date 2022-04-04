import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import '../data/local/constants.dart';
import 'dimens.dart';

Widget showCircleAvatar(String url, {double size = dp90}) {
  return ClipOval(
    child: CachedNetworkImage(
      imageUrl: url,
      //DefaultValue.randomImage,
      width: size,
      height: size,
      fit: BoxFit.cover,
      placeholder: (context, url) => SvgPicture.asset(AssetConstants.icLogo),
      errorWidget: (context, url, error) =>
          SvgPicture.asset(AssetConstants.icLogo),
    ),
  );
}

Widget showCachedNetworkImage(String url, {double size = dp90}) {
  return CachedNetworkImage(
    imageUrl: url,
    width: size,
    height: size,
    fit: BoxFit.cover,
    placeholder: (context, url) => SvgPicture.asset(AssetConstants.icLogo),
    errorWidget: (context, url, error) {
      return SvgPicture.asset(
        AssetConstants.icLogo,
        height: size / 2,
        width: size / 2,
      );
    },
  );
}

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

Widget showImageLocal(File file, {double size = dp90}) {
  return Container(
    padding: const EdgeInsets.all(dp5),
    child: Image.file(
      file,
      width: size,
      height: size,
      fit: BoxFit.cover,
    ),
  );
}

Widget iconWithTap(String iconPath,
    {Color? iconColor, VoidCallback? onPress, double size = 20}) {
  return InkWell(
    onTap: onPress,
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: iconPath.contains(".svg")
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
            ),
    ),
  );
}

Widget showCircleAvatarLocal(File file, {double size = 90}) {
  return ClipOval(
      child: Image.file(
    file,
    width: size,
    height: size,
    fit: BoxFit.cover,
  ));
}

// void showImageChooser(BuildContext context, Function(File, bool) onChoose) {
//   hideKeyboard(context);
//   changePhotoModalBottomSheet(() {
//     Get.back();
//     getImage(false, onChoose);
//   }, () {
//     Get.back();
//     getImage(true, onChoose);
//   }, width: Get.width * 0.85);
// }

// Future getImage(bool isGallery, Function(File, bool) onChoose) async {
//   if (isGallery) {
//     List<Media>? res = await ImagesPicker.pick(
//       count: 1,
//       pickType: PickType.image,
//       language: Language.System,
//       cropOpt: CropOption(
//         aspectRatio: const CropAspectRatio(2, 2),
//       ),
//     );
//     if (res != null) {
//       var file = File(res[0].path);
//       onChoose(file, isGallery);
//     }
//   } else {
//     List<Media>? res = await ImagesPicker.openCamera(
//       pickType: PickType.image,
//       cropOpt: CropOption(
//         aspectRatio: const CropAspectRatio(2, 2),
//       ),
//       quality: 0.5,
//     );
//     if (res != null) {
//       var file = File(res.first.path);
//       onChoose(file, isGallery);
//     }
//   }
// }

void saveFileOnTempPath(File chooseFile) async {
  getImageDirectoryPath(AssetConstants.pathTempProfileImageName)
      .then((tempPath) {
    // if(_controller.profileImage.value.path.contains(AssetConstants.pathTempProfileImageName)){
    //   _controller.profileImage.value.deleteSync();
    // }
    // File(tempPath).createSync(recursive: true);
    // File newFile = chooseFile.copySync(tempPath);
    // chooseFile.deleteSync();
    // _controller.profileImage.value = newFile;
  });
}

Future<String> getImageDirectoryPath(String path) async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  return "${appDocDir.path}${AssetConstants.pathTempImageFolder}${DateTime.now().millisecondsSinceEpoch}$path";
}

Widget showImage(String url, {double size = dp90}) {
  return Container(
    padding: const EdgeInsets.all(dp5),
    child: CachedNetworkImage(
      imageUrl: url,
      width: size,
      height: size,
      fit: BoxFit.cover,
      placeholder: (context, url) => SvgPicture.asset(AssetConstants.icLogo),
      errorWidget: (context, url, error) {
        return SvgPicture.asset(
          AssetConstants.icLogo,
          height: size / 2,
          width: size / 2,
        );
      },
    ),
  );
}

// getImage110(String imageUrl, bool isProvider, {double size = dp110}) {
//   ///GetUtils.printFunction("getImage", imageUrl, "imageUrl");
//   if (imageUrl == null || imageUrl.isEmpty) {
//     return isProvider
//         ? const AssetImage(AssetConstants.imgNotAvailable)
//         : Image.asset(AssetConstants.imgNotAvailable,
//         width: size, height: size, fit: BoxFit.fill);
//   } else {
//
//     var url = baseImageUrl + imageUrl;
//     return isProvider
//         ? NetworkImage(url)
//         : Image.network(url, width: size, height: size, fit: BoxFit.fill,
//         errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
//           return Image.asset(AssetConstants.no_image, width: size, height: size, fit: BoxFit.fill);
//         });
//   }
// }
