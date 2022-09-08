import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:dio_networking/Dio/dio_client.dart';
import 'package:dio_networking/models/user.dart';
import 'package:dio_networking/repository/user_repository.dart';

class DioUserRepositoryImpl implements UserRepository {
  // final dio = Dio();
  static const baseURL = 'https://reqres.in';
  static const userEndpoint = '$baseURL/api/users/2';
  static const userListEndpoint = '$baseURL/api/users?page=2';

  DioClient dioClient = DioClient();

  @override
  Future<Data> getSingleUser() async {
    try {
      var dioNew = dioClient.getDio();
      final response = await dioNew.get(userEndpoint);
      Data user = await Data.isolateUser(response);
      return user;
    } on DioError {
      throw Exception('Error in get single user');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Data>> getUserList() async {
    try {
      var dioNew = dioClient.getDio();
      final response = await dioNew.get(userListEndpoint);
      List<Data> users = await Data.isolateUserList(response);
      return users;
    } on DioError {
      throw Exception('Error in get single user');
    } catch (e) {
      rethrow;
    }
  }
}
