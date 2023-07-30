import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sliverdemo_controller.dart';

class SliverdemoView extends GetView<SliverdemoController> {
  const SliverdemoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverdemoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SliverdemoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
