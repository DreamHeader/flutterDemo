import 'package:get/get.dart';

import '../controllers/gridviewdemo_controller.dart';

class GridviewdemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GridviewdemoController>(
      () => GridviewdemoController(),
    );
  }
}
