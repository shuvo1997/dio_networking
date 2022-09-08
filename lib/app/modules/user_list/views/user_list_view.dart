import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  const UserListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UserListView'),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.loading.value) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: controller.usersObs.length,
                itemBuilder: (builder, index) {
                  return ListTile(
                    leading: Image.network(controller.usersObs[index].avatar!),
                    title: Text(
                        '${controller.usersObs[index].firstName} ${controller.usersObs[index].lastName}'),
                    subtitle: Text(controller.usersObs[index].email!),
                  );
                });
          }
        }));
  }
}
