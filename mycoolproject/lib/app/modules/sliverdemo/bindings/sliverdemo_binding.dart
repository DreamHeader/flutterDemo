import 'package:get/get.dart';

import '../controllers/sliverdemo_controller.dart';

class SliverdemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SliverdemoController>(
      () => SliverdemoController(),
    );
  }
}
