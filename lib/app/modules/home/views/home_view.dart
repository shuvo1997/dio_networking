import 'package:dio_networking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.SINGLE_USER);
                  },
                  child: const Text('Get single user')),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.USER_LIST);
                  },
                  child: const Text('List User')),
            ],
          ),
        ));
  }
}
