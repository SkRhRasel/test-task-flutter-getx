import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

const dateFormatYyyyMMDd = "yyyy-MM-dd";
const dateTimeFormatYyyyMMDdHhMm = "yyyy-MM-dd kk:mm";
const dateFormatMMDdYyyy = "MM/dd/yyyy";
const dateFormatMMMMDdDyyy = "MMMM dd, yyyy";
const dateTimeFormatDdMMMMYyyyHhMm = "dd MMMM yyyy | hh:mm a";

void showToast(String text, {bool isError = false, bool isLong = false}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: isError ? Colors.red : Get.theme.primaryColorDark,
    textColor: Colors.white,
    //fontSize: 16.0
  );
}

void showLoadingDialog({bool isDismissible = false}) {
  if (Get.isDialogOpen == null || !Get.isDialogOpen!) {
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: isDismissible);
  }
}

void hideLoadingDialog() {
  if (Get.isDialogOpen != null && Get.isDialogOpen!) {
    Get.back();
  }
}

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

String formatDate(DateTime? dateTime, {String format = dateFormatYyyyMMDd}) {
  if (dateTime != null) {
    String formatStr = DateFormat(format).format(dateTime);
    return formatStr;
  } else {
    return "";
  }
}


String formatDateForInbox(DateTime? dateTime) {
  if (dateTime != null) {
    String formatStr = "";
    DateTime now = DateTime.now();
    var diffDt = now.difference(dateTime);
    if (diffDt.inDays > 0) {
      formatStr = formatDate(dateTime, format: dateTimeFormatDdMMMMYyyyHhMm);
    } else if (diffDt.inHours > 0) {
      formatStr = "${diffDt.inHours}" " Hours ago".tr;
    } else if (diffDt.inMinutes > 0) {
      formatStr = "${diffDt.inMinutes}" " Minutes ago".tr;
    } else {
      formatStr = "Just now".tr;
    }
    return formatStr;
  }
  return "";
}

String getVerboseDateTimeRepresentation(DateTime dateTime) {
  DateTime now = DateTime.now();
  DateTime justNow = now.subtract(const Duration(minutes: 1));
  DateTime localDateTime = dateTime.toLocal();

  if (!localDateTime.difference(justNow).isNegative) {
    return 'Just Now';
  }

  String roughTimeString = DateFormat('jm').format(dateTime);
  if (localDateTime.day == now.day &&
      localDateTime.month == now.month &&
      localDateTime.year == now.year) {
    return 'Today, $roughTimeString';
  }

  DateTime yesterday = now.subtract(const Duration(days: 1));

  if (localDateTime.day == yesterday.day &&
      localDateTime.month == now.month &&
      localDateTime.year == now.year) {
    return 'Yesterday, $roughTimeString';
  }

  if (now.difference(localDateTime).inDays < 4) {
    String weekday = DateFormat('EEEE').format(localDateTime);

    return '$weekday, $roughTimeString';
  }

  return '${DateFormat('yMd').format(dateTime)}, $roughTimeString';
}

String stringNullCheck(String? value) {
  return value ?? "";
}

void editTextFocusDisable(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

String getEnumString(dynamic enumValue) {
  String string = enumValue.toString();
  try {
    string = string.split(".").last;
    return string;
  } catch (_) {}
  return "";
}

String amountFormat(dynamic amount) {
  String amountStr = "00.0";
  if (amount != null) {
    double amaDo = makeDouble(amount);
    amountStr = amaDo.toStringAsFixed(2);
  }
  return "$amountStr €";
}

String distanceFormat(dynamic distance) {
  String distanceStr = "0";
  if (distance != null) {
    var kmDis = makeDouble(distance);
    distanceStr = kmDis < 1 ? "1" : kmDis.toStringAsFixed(2);
  }
  return "$distanceStr KM";
}

double makeDouble(dynamic value) {
  if (value == null) {
    return 0.0;
  }
  if (value is String && value.isNotEmpty) {
    return double.parse(value);
  } else if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  }
  return 0.0;
}

DateTime? makesDate(Map<String, dynamic> json, String key,
    {bool isDefault = false}) {
  if (json.containsKey(key)) {
    var value = json[key];
    if (value is String && value.isNotEmpty) {
      if (!value.contains("z") && !value.contains("Z")) {
        value = value + "Z";
      }
      return DateTime.parse(value);
    }
  }
  if (isDefault) {
    return DateTime.now();
  }
  return null;
}

int makeInt(dynamic value) {
  if (value is String && value.isNotEmpty) {
    return int.parse(value);
  } else if (value is double) {
    return value.toInt();
  } else if (value is int) {
    return value;
  }
  return 0;
}


