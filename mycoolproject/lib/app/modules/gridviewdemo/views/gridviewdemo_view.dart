import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gridviewdemo_controller.dart';

class GridviewdemoView extends GetView<GridviewdemoController> {
  const GridviewdemoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridviewdemoView'),
        centerTitle: true,
      ),
      body: _columDemo(),
    );
  }

  // Column 如果想要滑动 一班是SingleChildScrollView
  Widget _columDemo() {
    return SingleChildScrollView(
      child: Column(
        children: [
          FlutterLogo(
            size: 500,
          ),
          FlutterLogo(
            size: 500,
          )
        ],
      ),
    );
  }

  Widget _reorderableListViewDemo() {
    return ReorderableListView(
        children: List.generate(10, (index) {
          return Text(
            "index in $index",
            key: UniqueKey(),
          );
        }),
        onReorder: (int oldIndex, int newIndex) {
          print("old:$oldIndex,newIndex:$newIndex");
        });

    // ReorderableList(
    //     itemBuilder: ((context, index) {
    //       return Text(
    //         "index in $index",
    //         key: UniqueKey(),
    //       );
    //     }),
    //     itemCount: 10,
    //     onReorder: (int oldIndex, int newIndex) {});
  }

  Widget _pageViewDemo() {
    return PageView(
      onPageChanged: (index) {
        print(index);
      },
      scrollDirection: Axis.horizontal, // 控制滚动方向
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.black,
        ),
        Container(color: Colors.yellow),
      ],
    );
  }

  // ListWheelScrollView
  // ignore: non_constant_identifier_names
  Widget _ListWheelScrollView() {
    return ListWheelScrollView(
        magnification: 2.5,
        itemExtent: 100,
        useMagnifier: true, // 是否有放大镜效果
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          print(index);
        },
        children: List.generate(10, (index) {
          return Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text("Hello"),
          );
        }));
  }

  // ignore: non_constant_identifier_names
  // GridViewBuilder
  Widget GridViewBuilder() {
    return GridView.builder(
        itemCount:
            100, // SliverGridDelegateWithMaxCrossAxisExtent 这个是指定交叉轴的宽度 自己计算一行放几个
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // 这个是指定个数
            crossAxisCount: 4,
            childAspectRatio: 1 / 2,
            crossAxisSpacing: 10),
        itemBuilder: ((context, index) {
          return Container(
            color: Colors.blue[index % 8 * 100],
            child: const Center(
              child: Text("11111111"),
            ),
          );
        }));
  }
}
