import 'package:get/get.dart';

import '../controllers/listview_controller.dart';

class ListviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListviewController>(
      () => ListviewController(),
    );
  }
}
