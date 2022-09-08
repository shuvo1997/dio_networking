import 'package:dio_networking/repository/user_repository.dart';
import 'package:dio_networking/repository/user_repository_impl.dart';
import 'package:get/get.dart';

import '../../../../models/user.dart';

class UserListController extends GetxController {
  //TODO: Implement UserListController
  var usersObs = <Data>[].obs;
  var loading = true.obs;

  UserRepository userRepository = DioUserRepositoryImpl();

  @override
  void onInit() {
    super.onInit();
    fetchListUser();
  }

  fetchListUser() async {
    var users = await userRepository.getUserList();
    usersObs.value = users;
    loading(false);
  }
}
