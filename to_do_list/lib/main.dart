import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/screen/home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'ToDo App',
    
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}


