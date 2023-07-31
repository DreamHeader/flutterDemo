import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mycoolproject/app/modules/sliverdemo/members_model.dart';

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
          if (index == 2) {
            Get.toNamed("/gridviewdemo");
          }
          if (index == 3) {
            Get.toNamed("/sliverdemo");
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
                      left: 10,
                      right: 10,
                      bottom: 2,
                      child: Container(
                        height: 90,
                        child: LayoutBuilder(
                          builder: (context, bc) {
                            return CustomPaint(
                              painter: GradientBoundPainter(
                                  colors: [Colors.red, Colors.blue],
                                  width: bc.maxWidth,
                                  height: bc.maxHeight),
                            );
                          },
                        ),
                      )),
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

/// 渐变色的边框
class GradientBoundPainter extends CustomPainter {
  final List<Color> colors;
  final double width;
  final double height;
  final double strokeWidth;
  const GradientBoundPainter({
    Key? key,
    required this.colors,
    required this.width,
    required this.height,
    this.strokeWidth = 2.0,
  });
  @override
  void paint(Canvas canvas, Size size) {
    //定义矩形的宽高
    final rectWidth = width, rectHeight = height;
    //圆角。必要的话可以将其作为变量传进来
    final radius = 10.0;
    //定义矩形的位置和尺寸
    Rect rect = Offset(
            size.width / 2 - rectWidth / 2, size.height / 2 - rectHeight / 2) &
        Size(rectWidth, rectHeight);
    //RRect.fromRectAndRadius一个具有圆角的矩形
    RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    //绘制
    final paint = Paint()
      //创建线性渐变着色器
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: colors,
      ).createShader(rect)
      ..strokeWidth = strokeWidth
      //只绘制边框而不填充
      ..style = PaintingStyle.stroke;
    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant GradientBoundPainter oldDelegate) {
    return oldDelegate.colors != colors;
  }
}
