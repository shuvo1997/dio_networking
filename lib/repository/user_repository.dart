import '../models/user.dart';

abstract class UserRepository {
  Future<Data> getSingleUser();

  Future<List<Data>> getUserList();
}
