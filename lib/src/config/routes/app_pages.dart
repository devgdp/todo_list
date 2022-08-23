import 'package:get/get.dart';
import 'package:to_do_list/src/features/app/presentations/bindings/app_binding.dart';
import 'package:to_do_list/src/features/app/presentations/pages/todo_list_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.APP,
      page: () => TodoListPage(),
      binding: AppBinding(),
    )
  ];
}
