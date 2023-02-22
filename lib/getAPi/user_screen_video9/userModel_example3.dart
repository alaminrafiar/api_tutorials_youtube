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
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
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
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<UserModel>> snapsot) {
                if (!snapsot.hasData) {
                  //snapsot ar age ! ta na dile aita sodo gorte thakbe
                  return CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Reusbalerow(title:"name",value:snapsot.data![index].name.toString()),
                            Reusbalerow(title:"username",value:snapsot.data![index].username.toString()),
                            Reusbalerow(title:"email",value:snapsot.data![index].email.toString()),
                            Reusbalerow(title:"address",value:snapsot.data![index].address!.city.toString())
                            //ai khane address alada class a ase ai jonno city & sathe  !null chek use kora hoise
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text("name"),
                            //     Text(snapsot.data![index].name.toString()),
                              ],
                            ),

                        ),

                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class Reusbalerow extends StatelessWidget {
  String title, value;

  Reusbalerow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
