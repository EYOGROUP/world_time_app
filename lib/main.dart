// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time_app/routes/home.dart';
import 'package:world_time_app/routes/loading.dart';
import 'package:world_time_app/routes/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Loading.id,
      routes: {
        Loading.id: (context) => Loading(),
        Home.id: (context) => Home(),
        Location.id: (context) => Location(),
      },
    );
  }
}
