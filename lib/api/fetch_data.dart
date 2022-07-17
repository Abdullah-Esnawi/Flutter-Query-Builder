import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:query_builder/api/model/user_model.dart';

class UserData {

  var data = [];
  String url = "https://mocki.io/v1/9613e66d-44d1-428b-81a0-97ca5e358c67";
  List<User> usersList = <User>[];

  Future<List<User>> getUsers() async {
    final res = await http.get(Uri.parse(url));
    try {
      if (res.statusCode == 200) {
        data = json.decode(res.body);
        usersList = data.map((e) => User.fromJson(e)).toList();
      } else {
        print('api error');
      }
    } catch (err) {
      print('Error: $err');
    }
    return usersList;
  }
}
