import 'package:dio_networking/models/user.dart';
import 'package:dio_networking/repository/user_repository.dart';
import 'package:dio_networking/repository/user_repository_impl.dart';
import 'package:get/get.dart';

class SingleUserController extends GetxController {
  //TODO: Change to final
  var singleUser = Data().obs;
  var loading = true.obs;

  UserRepository userRepository = DioUserRepositoryImpl();

  @override
  void onInit() {
    fetchSingleUser();
    super.onInit();
  }

  fetchSingleUser() async {
    var user = await userRepository.getSingleUser();
    singleUser.value = user;
    loading(false);
  }
}
