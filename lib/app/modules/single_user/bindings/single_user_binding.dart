import 'package:get/get.dart';

import '../controllers/single_user_controller.dart';

class SingleUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleUserController>(
      () => SingleUserController(),
    );
  }
}
