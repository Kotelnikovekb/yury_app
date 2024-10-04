import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:xchat/core/constants/project_routes.dart';

import 'core/theme/themes.dart';
import 'core/utils.dart';
import 'core/x_service/contact_x_service.dart';
import 'core/x_service/theme_service.dart';
import 'core/x_service/user_x_service.dart';
import 'core/constants/firebase_options.dart';

final logger = Logger(
  printer: PrettyPrinter(),
);
const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
        encryptedSharedPreferences: true
    )
);

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await  initializeDateFormatting(' ', null);
  Get.config(
    enableLog: true,
    logWriterCallback: (text, {isError = false}) {
      //Clipboard.setData(ClipboardData(text: text));
      logger.i(text);
    },
  );

  /// если только книжная ориентация

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  final String? initRoute;
  const MyApp({super.key, this.initRoute});


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: '{{name}}',
      theme: data,
      darkTheme: createDarkTheme(),
      themeMode: mode,
      getPages: ProjectRoutes.pages,
      initialRoute: initRoute?? ProjectRoutes.START,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class AppBinding implements Bindings {
  @override
  void dependencies() {
  }
}