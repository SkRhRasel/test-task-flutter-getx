import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../data/local/constants.dart';

class LanguageUtil {

  final List<Language> locales = [
    Language(code: 'en', name: "ENGLISH", local: const Locale('en', 'US')),
    Language(code: 'pt', name: "Português", local: const Locale('pt', 'PT')),
    ///Language(code: 'bn', name: "বাংলা", local: Locale('bn', 'BD')),
  ];

  // void dialogForLanguageChange() {
  //   Get.defaultDialog(
  //     title: "",
  //     radius: dp10,
  //     content: Container(
  //       height: Get.width / 2,
  //       width: Get.width / 2,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           textTitleLargeMain("Choose Your Language".tr, dp18, TextAlign.center, Get.theme.primaryColorDark, maxLines: 1),
  //           VSpacer20(),
  //           ListView.separated(
  //               shrinkWrap: true,
  //               itemBuilder: (context, index) {
  //                 return Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: GestureDetector(
  //                     child: Text(locales[index].name),
  //                     onTap: () {
  //                       Get.back();
  //                       Get.updateLocale(locales[index].local);
  //                       GetStorage().write(PrefKeyConstant.languageKey, locales[index].code);
  //                     },
  //                   ),
  //                 );
  //               },
  //               separatorBuilder: (context, index) {
  //                 return Divider(
  //                   color: Get.theme.accentColor,
  //                 );
  //               },
  //               itemCount: locales.length)
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Locale getCurrentLocal() {
    String currentKey = GetStorage().read(PrefKeyConstant.languageKey);
    Language language = LanguageUtil().locales.singleWhere((element) => element.code == currentKey);
    return language.local;
  }

  String getCurrentKey() {
    return GetStorage().read(PrefKeyConstant.languageKey);
  }
}

class Language {
  String code;
  String name;
  Locale local;

  Language({required this.code, required this.name, required this.local});

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        code: json["code"],
        name: json["name"],
        local: json["local"],
      );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "local": local,
  };
}
