import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/userModel_Example3.dart';

class user_screen extends StatefulWidget {
  const user_screen({Key? key}) : super(key: key);

  @override
  State<user_screen> createState() => _user_screenState();
}

class _user_screenState extends State<user_screen> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
   var data=jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for(Map i in data){
        userList.add(UserModel.fromJson(i));
        print(i["name"]);
      }
      return userList;
    } else {
      return userList;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Api courses Class 9 "),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
