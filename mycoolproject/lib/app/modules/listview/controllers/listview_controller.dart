import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../git_event_model.dart';

class ListviewController extends GetxController {
  final List<String> dataSource = [
    "AAAAA",
    "BBBBB",
    "CCCCCCC",
    "DDDDDDDD",
    "FFFFFF",
    "FEEEEE",
    "AAAAA",
    "BBBBB",
    "CCCCCCC",
    "DDDDDDDD",
    "FFFFFF",
    "FEEEEE",
  ];
  RxList gitEventList = [].obs;
  @override
  void onInit() {
    super.onInit();
    requstData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future requstData() async {
    final dio = Dio();
    final response = await dio.get('https://api.github.com/events');
    if (response.statusCode == 200) {
      for (var element in response.data) {
        GitEvent event = GitEvent.fromJson(element);
        gitEventList.add(event);
      }
      update();
    }
  }
}
