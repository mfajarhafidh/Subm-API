import 'package:get/get.dart';

import 'package:submission/infrastructure/navigation/bindings/controllers/home/home_binding.dart';
import 'package:submission/presentation/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
