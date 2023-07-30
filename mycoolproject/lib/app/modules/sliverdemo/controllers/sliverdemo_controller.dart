import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mycoolproject/app/modules/sliverdemo/members_model.dart';

class SliverdemoController extends GetxController {
  //TODO: Implement SliverdemoController
  Rx<Members> data = Members().obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _requestData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future _requestData() async {
    final dio = Dio();
    final response =
        await dio.get('https://h5.48.cn/resource/jsonp/allmembers.php?gid=10');
    if (response.statusCode == 200) {
      data.value = Members.fromJson(response.data);
      update();
    }
  }
}
