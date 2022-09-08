import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/single_user_controller.dart';

class SingleUserView extends StatelessWidget {
  SingleUserView({Key? key}) : super(key: key);

  final SingleUserController singleUserController =
      Get.put(SingleUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleUserView'),
        centerTitle: true,
      ),
      body: Center(child: Obx(() {
        if (singleUserController.loading.value) {
          return const CircularProgressIndicator();
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(singleUserController.singleUser.value.avatar!),
              Text(
                '${singleUserController.singleUser.value.firstName!} ${singleUserController.singleUser.value.lastName!}',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          );
        }
      })),
    );
  }
}
