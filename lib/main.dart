import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/config/routes/app_pages.dart';
import 'src/core/helpers/app_helper.dart';
import 'src/features/app/presentations/bindings/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorObservers: [AppHelper.routeObserver],
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      getPages: AppPages.pages,
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.APP,
    );
  }
}
