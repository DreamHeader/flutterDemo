import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/localdata.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: HomeListView());
  }
}

class HomeListView extends StatefulWidget {
  const HomeListView({super.key});

  @override
  State<HomeListView> createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        controller: _controller,
        child: NotificationListener(
            onNotification: (notification) {
              // print(notification); // 可以监听滚动的事件
              return true;
            },
            child: RefreshIndicator(
                //增加下啦刷新控件
                onRefresh: () {
                  return Future.delayed(Duration(seconds: 2));
                },
                strokeWidth: 4.0,
                color: Colors.red,
                backgroundColor: Colors.grey,
                child: ListView.builder(
                    itemCount: localhomeList.length,
                    itemBuilder: ((context, index) {
                      return _HomeListItemCell(context, index);
                    })))));
  }

  // ignore: non_constant_identifier_names
  Widget _HomeListItemCell(BuildContext context, int index) {
    String title = localhomeList[index];
    return InkWell(
        onTap: () {
          if (index == 1) {
            Get.toNamed("/listview");
          }
        },
        child: Dismissible(
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              child: Icon(Icons.abc_outlined),
            ),
            secondaryBackground: Container(
              color: Colors.black12,
              alignment: Alignment.centerLeft,
              child: Icon(Icons.abc_outlined),
            ),
            // confirmDismiss: (direction) sync {
            //   // 控制是否要删掉
            //   return await Future.delayed(Duration(seconds: 2));
            // },
            // 删除控件
            onDismissed: (direction) {
              print(direction);
              if (direction == DismissDirection.startToEnd) {
                print("direction == DismissDirection.startToEnd");
              }
            },
            key: UniqueKey(),
            child: Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: 100,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 10),
                    color: Colors.red[index % 9 * 100],
                    child: Text(title,
                        style: TextStyle(fontSize: 25, color: Colors.black)),
                  ),
                  Positioned(
                      right: 10,
                      left: 10,
                      bottom: 0,
                      child: Container(
                        color: Colors.black,
                        height: 2,
                      ))
                ],
              ),
            )));
  }
}
