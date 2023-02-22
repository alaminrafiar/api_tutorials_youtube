

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'getAPi/title_with_photos_video_8/example_pothos_api_example2.dart';
import 'getAPi/user_screen_video9/userModel_example3.dart';

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
      home: user_screen(),
    );
  }
}


