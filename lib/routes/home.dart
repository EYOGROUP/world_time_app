// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:world_time_app/routes/location.dart';

class Home extends StatefulWidget {
  static String id = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 55, 53, 63),
          image: DecorationImage(
              image: AssetImage(data["image"]), fit: BoxFit.cover),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(110, 50)),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(131, 33, 149, 243),
                  ),
                ),
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, Location.id);

                  setState(() {
                    if (result == null) {
                      result = {
                        "timezone": "Please Choose a Location",
                        "time": "",
                        "image": "day.png",
                      };
                    } else {
                      data = {
                        "timezone": result["timezone"],
                        "time": result["time"],
                        "image": result["image"],
                      };
                    }
                  });
                },
                icon: Icon(Icons.location_on_outlined,
                    color: Colors.amber.shade900),
                label: Text(
                  "Choose Location",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                width: double.infinity,
                color: Color.fromARGB(82, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      "${data["time"] ?? ""}",
                      style: TextStyle(color: Colors.white, fontSize: 55),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "${data["timezone"] ?? ""}",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
