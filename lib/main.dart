import 'package:api_tutorials_youtube/getAPi/post_show_in_display/home_scrren_video_7.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'getAPi/title_with_photos_video_8/example_pothos_api.dart';

void main() {
  runApp(const rest_api());
}

class rest_api extends StatelessWidget {
  const rest_api({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ExampleTwo(),
    );
  }
}


