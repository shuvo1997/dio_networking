import 'dart:isolate';

import 'package:dio/dio.dart';

class Data {
  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };

  static void deserializeUser(List<dynamic> values) {
    SendPort sendPort = values[0];
    Map<String, dynamic> dataMap = values[1].data;
    sendPort.send(Data.fromJson(dataMap['data']));
  }

  static Future<Data> isolateUser(Response response) async {
    ReceivePort receivePort = ReceivePort();
    final isolate = await Isolate.spawn<List<dynamic>>(
        deserializeUser, [receivePort.sendPort, response]);
    final user = await receivePort.first;
    isolate.kill(priority: Isolate.immediate);
    return user;
  }

  static void deserializeUserList(List<dynamic> values) {
    SendPort sendPort = values[0];
    Map<String, dynamic> dataMap = values[1].data;
    List<Data> users = [];
    for (var u in dataMap['data']) {
      Data user = Data.fromJson(u);
      users.add(user);
    }
    sendPort.send(users);
  }

  static Future<List<Data>> isolateUserList(Response response) async {
    ReceivePort receivePort = ReceivePort();
    final isolate = await Isolate.spawn<List<dynamic>>(
        deserializeUserList, [receivePort.sendPort, response]);
    final users = await receivePort.first;
    isolate.kill(priority: Isolate.immediate);
    return users;
  }
}
