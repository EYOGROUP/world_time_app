// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_time_app/classes/getdata-class.dart';
import 'package:world_time_app/routes/home.dart';

class Loading extends StatefulWidget {
  static String id = "/";
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> getDataLoadingPage() async {
    AllCountries loadingCountry = AllCountries(region: "Europe/Berlin");
    await loadingCountry.getData();

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, Home.id, arguments: {
      "timezone": loadingCountry.timeZone,
      "time": loadingCountry.time,
      "image": loadingCountry.image
    });
  }

  @override
  void initState() {
    super.initState();
    getDataLoadingPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.grey.shade400,
          size: 150,
        ),
        // child: ElevatedButton(
        //   child: Text("CLick her"),
        //   onPressed: () {
        //     getData();
        //   },
        // ),
      ),
    );
  }
}
