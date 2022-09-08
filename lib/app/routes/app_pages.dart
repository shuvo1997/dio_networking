import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/single_user/bindings/single_user_binding.dart';
import '../modules/single_user/views/single_user_view.dart';
import '../modules/user_list/bindings/user_list_binding.dart';
import '../modules/user_list/views/user_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_USER,
      page: () => SingleUserView(),
      binding: SingleUserBinding(),
    ),
    GetPage(
      name: _Paths.USER_LIST,
      page: () => const UserListView(),
      binding: UserListBinding(),
    ),
  ];
}
