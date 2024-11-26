import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:getx_base/common_ui/theme/my_theme.dart';
import 'package:getx_base/core/auth_storage/auth_storage.dart';
import 'package:getx_base/core/network/http_request.dart';
import 'package:getx_base/core/network/http_request_impl.dart';
import 'package:getx_base/core/routers/my_routes.dart';
import 'package:getx_base/core/utils/my_scroll_behavior.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    dotenv.load(),
    GetStorage.init(),
  ]);
  AuthStorage.loadData();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      themeMode: ThemeMode.light,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: const [Locale('en', 'US')],
      scrollBehavior: MyScrollBehavior(),
      getPages: appPages,
      initialRoute: MyRoutes.samplePage,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialBinding: BindingsBuilder(
        () {
          Get.put<IHttpRequest>(HttpRequestImpl());
        },
      ),
    );
  }
}
