import 'package:get/get.dart';

import '../modules/gridviewdemo/bindings/gridviewdemo_binding.dart';
import '../modules/gridviewdemo/views/gridviewdemo_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/listview/bindings/listview_binding.dart';
import '../modules/listview/views/listview_view.dart';
import '../modules/sliverdemo/bindings/sliverdemo_binding.dart';
import '../modules/sliverdemo/views/sliverdemo_view.dart';

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
      name: _Paths.LISTVIEW,
      page: () => const ListviewView(),
      binding: ListviewBinding(),
    ),
    GetPage(
      name: _Paths.GRIDVIEWDEMO,
      page: () => const GridviewdemoView(),
      binding: GridviewdemoBinding(),
    ),
    GetPage(
      name: _Paths.SLIVERDEMO,
      page: () => const SliverdemoView(),
      binding: SliverdemoBinding(),
    ),
  ];
}
