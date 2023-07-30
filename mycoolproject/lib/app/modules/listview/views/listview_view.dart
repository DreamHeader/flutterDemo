import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mycoolproject/app/modules/listview/git_event_model.dart';

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
        body: const CustomListView());
  }
}

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final ListviewController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scrollbar(
        child: _controller.gitEventList.isEmpty
            ? const Center(
                child: Text(
                  "Not data",
                  style: const TextStyle(fontSize: 40),
                ),
              )
            : RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.builder(
                    itemExtent: 80,
                    itemCount: _controller.gitEventList.length,
                    itemBuilder: ((context, index) {
                      return Dismissible(
                          confirmDismiss: (direction) {
                            return showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    title: Text("Are you sure?"),
                                    content: Text(
                                        "Do you want to delete this item?"),
                                    actions: [
                                      FloatingActionButton(
                                        child: Text("Cancel"),
                                        onPressed: () {
                                          return Navigator.of(context)
                                              .pop(false);
                                        },
                                      ),
                                      FloatingActionButton(
                                        child: Text("Sure"),
                                        onPressed: () {
                                          return Navigator.of(context)
                                              .pop(true);
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                          key: UniqueKey(),
                          child: _HomeListItemCell(context, index));
                    })))));
  }

  Future _refresh() async {
    await _controller.requstData();
  }

  // ignore: non_constant_identifier_names
  Widget _HomeListItemCell(BuildContext context, int index) {
    GitEvent gitEvent = _controller.gitEventList[index];
    return ListTile(
      leading: Image.network(gitEvent.actor?.avatarUrl ?? ""),
      title: Text(gitEvent.repo?.name ?? ""),
      subtitle: Text(gitEvent.createdAt ?? ""),
    );
  }
}
