import 'dart:convert';

import 'package:api_tutorials_youtube/models/postModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

//[] arry ar botore name na thakar karone ato kiso likhte hoilo
class _home_screenState extends State<home_screen> {
  List<PostModel> postList = [];

  Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear(); // opporer list ar jonno []
      for (Map i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Demo"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading");
                  } else {
                    return ListView.builder(itemBuilder: (context, index) {
                      postList.length;
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('title \n' +
                                  postList[index].title.toString()),
                              Text('Discription\n' +
                                  postList[index].title.toString())
                            ],
                          ),
                        ),
                      );
                      // return Text(postList[index].title.toString());
                    });
                  }
                }),
          )
        ],
      ),
    );
  }
}
