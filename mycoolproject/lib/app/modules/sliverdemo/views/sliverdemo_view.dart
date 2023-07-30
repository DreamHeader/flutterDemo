import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mycoolproject/app/modules/sliverdemo/members_model.dart';

import '../controllers/sliverdemo_controller.dart';

class _MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Color color = Colors.red;
  _MyHeaderDelegate(this.title);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        height: 32, color: color, child: FittedBox(child: Text(title)));
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 32;

  @override
  // TODO: implement minExtent
  double get minExtent => 32;

  @override
  bool shouldRebuild(covariant _MyHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return oldDelegate.title != title;
  }
}

class SliverdemoView extends GetView<SliverdemoController> {
  const SliverdemoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SliverdemoView'),
          centerTitle: true,
        ),
        body: SliverPrersitentHeader());
  }

  // Sliver实现列表+网络数据对接
  Widget SliverPrersitentHeader() {
    return Obx(() {
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(), //加一个这个可以解决第一个SliverPersistentHeader 不随着整体一起下滑的问题
          SliverPersistentHeader(
            delegate: _MyHeaderDelegate("Sll"),
            pinned: true, //是否让他一直在
          ),
          _buildSliverMemerList("Sll"),
          SliverPersistentHeader(
            delegate: _MyHeaderDelegate("Nll"),
            pinned: true, //是否让他一直在
          ),
          _buildSliverMemerList("Nll"),
          SliverPersistentHeader(
            delegate: _MyHeaderDelegate("X"),
            pinned: true, //是否让他一直在
          ),
          _buildSliverMemerList("X")
        ],
      );
    });
  }

  Widget _buildSliverMemerList(String titile) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        Rows model = controller.data.value.rows?[index] ?? Rows();
        String avatar =
            "https://www.snh48.com/images/member/zp_${model.sid ?? ""}.jpg";
        return Container(
            color: Colors.blue[200],
            margin: EdgeInsets.only(top: 2, bottom: 2, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: CircleAvatar(
                    child: Image.network(avatar),
                    radius: 32,
                    backgroundColor: Colors.white,
                  ),
                ),
                Text(model.fname ?? "")
              ],
            ));
      }, childCount: controller.data.value.rows?.length ?? 0),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
    );
  }

  /////
  Widget sliverView_SliverToSeliver() {
    // SliverFillRemaining
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          // title: Text("Sliver Future"),
          floating: true, // 稍微一下啦就展示
          snap: true,
          // pinned: true,
          expandedHeight: 200, // expandedHeight stretch这两个可以进行拓展
          stretch: true, //允许拓展这块可以拉伸
          flexibleSpace: FlexibleSpaceBar(
            background: FlutterLogo(),
            title: Text("flexible Sliver Future"),
            collapseMode: CollapseMode.parallax, //默认的效果已经是最好的
            stretchModes: [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
              // StretchMode.fadeTitle
            ],
          ),
        ),
        //SliverIgnorePointer() 忽略点击事件
        // SliverAnimatedOpacity
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: 200,
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              }, childCount: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4)),
        ),
        const SliverToBoxAdapter(
          child: Divider(
            thickness: 4,
            // height: 10,
            color: Colors.red,
          ),
        ),
        const SliverFillRemaining(
          // 填充剩余的控件 用于sliver的尾部
          child: Center(
            child: FlutterLogo(
              size: 100,
            ),
          ),
        ),
        SliverLayoutBuilder(builder: (context, constrints) {
          print(constrints);
          return const SliverToBoxAdapter();
        })
      ],
    );
  }

  Widget sliverView_SliverBar() {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text("Sliver Future"),
          floating: true, // 稍微一下啦就展示
          snap: true,
          // pinned: true,
          expandedHeight: 200, // expandedHeight stretch这两个可以进行拓展
          stretch: true, //允许拓展这块可以拉伸
          flexibleSpace: FlexibleSpaceBar(
            background: FlutterLogo(),
            title: Text("flexible Sliver Future"),
            collapseMode: CollapseMode.parallax, //默认的效果已经是最好的
            stretchModes: [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
              // StretchMode.fadeTitle
            ],
          ),
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 200,
                color: Colors.primaries[index % Colors.primaries.length],
              );
            }, childCount: 100),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4))
      ],
    );
  }

  Widget sliverView_FillViewPort() {
    // 有点类似Pageview
    return CustomScrollView(
      slivers: [
        SliverFillViewport(
            delegate: SliverChildListDelegate([Text("1111"), Text("22222")]))
      ],
    );
  }

  Widget sliverView_prototypeExtentList() {
    return CustomScrollView(
      slivers: [
        SliverPrototypeExtentList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                color: Colors.primaries[index % 18],
              );
            }),
            prototypeItem: FlutterLogo(
              //原型
              size: 48,
            ))
      ],
    );
  }

  Widget sliverView_fixedExtentList() {
    return CustomScrollView(
      slivers: [
        SliverFixedExtentList(
            //这个时主要是为了处理在一个列表中想要有不同高度的元素
            delegate: SliverChildListDelegate([
              FlutterLogo(
                size: 200,
              ),
              FlutterLogo(
                size: 300,
              ),
              FlutterLogo(
                size: 100,
              )
            ]),
            itemExtent: 300),
        SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 200,
                color: Colors.primaries[index % Colors.primaries.length],
              );
            }, childCount: 23),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4))
      ],
    );
  }

  Widget sliverView_SliverGrid() {
    return CustomScrollView(
      slivers: [
        SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 200,
                color: Colors.primaries[index % Colors.primaries.length],
              );
            }, childCount: 23),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4))
      ],
    );
  }

  Widget sliverView_SliverList() {
    return CustomScrollView(
      slivers: [
        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              height: 200,
              color: Colors.primaries[index % 18],
            );
          },
        ))
      ],
    );
  }

  Widget sliverView_SliverToBoxAdapter() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: FlutterLogo(
            size: 200,
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              FlutterLogo(
                size: 200,
              ),
              FlutterLogo(
                size: 200,
              )
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: FlutterLogo(
            size: 200,
          ),
        )
      ],
    );
  }

  Widget defalutView() {
    return Center(
      child: SizedBox(
        //视窗
        width: 300,
        height: 450,
        child: ListView.builder(
            itemExtent: 90,
            itemCount: 20,
            itemBuilder: ((context, index) {
              return Container(
                color: Colors.primaries[index % 18],
                height: 100,
              );
            })),
      ),
    );
  }
}
