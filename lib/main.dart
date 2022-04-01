import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_test_task_flutter_getx/data/local/strings.dart';
import 'package:gallery_test_task_flutter_getx/utils/config.dart';
import 'package:gallery_test_task_flutter_getx/utils/shared_pref_utils.dart';
import 'package:get/get.dart';
import 'data/local/constants.dart';
import 'ui/features/splash/splash_page.dart';
import 'utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  String lanCode = await SharedPrefUtil.getString(PrefKeyConstant.kLanguage);
  lanCode = lanCode.isEmpty ? ValueConstants.vLanguageCode : lanCode;
  gLanguageCode = lanCode;
  bool isDark = await SharedPrefUtil.getBoolean(PrefKeyConstant.kIsDark);
  currentTheme.setThemeMode(isDark);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    currentTheme.addListener(() {
      setState(() {});
    });
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      title: "kAppName".tr,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: currentTheme.currentTheme(),
      translations: Strings(),
      fallbackLocale: Locale(ArrayConstants.kLanguageMap.values.toList().first),
      initialRoute: "/",
      defaultTransition: Transition.rightToLeft,
      home: const SplashScreen(),
    );
  }
}
