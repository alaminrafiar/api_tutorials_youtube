import 'dart:convert';

import 'package:api_tutorials_youtube/models/postModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class home_screen_example1 extends StatefulWidget {
  const home_screen_example1({Key? key}) : super(key: key);

  @override
  State<home_screen_example1> createState() => _home_screenState();
}

//[] arry ar botore name na thakar karone ato kiso likhte hoilo
class _home_screenState extends State<home_screen_example1> {
  List<PostModel> postList = [];

  Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear(); // opporer list ar jonno []
      // aita lekhte hoi karon []  ar jodi kono name na thake thaole
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
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      postList.length;
                      return Card(
                        //video number 7 a 15 minit ar por khob sundor kore kora ase nijer koto
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'title',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              // Text('title',style: Theme.of(context).textTheme.bodyText1,),//sundor korar jonno ai line ta use kora hoi
                              Text(postList[index].title.toString()),
                              SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Discription",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Discription\n${postList[index].body}')
                            ],
                          ),
                        ),
                      );
                      // return Text(postList[index].title.toString());
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
