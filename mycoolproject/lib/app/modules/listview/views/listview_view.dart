import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/listview_controller.dart';

class ListviewView extends GetView<ListviewController> {
  const ListviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
