import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AllCountries {
  String? region;
  String? flag;
  String? countryName;
  AllCountries({@required this.region, this.countryName, this.flag});
  String? time;
  String? timeZone;
  String? image;
  Future<void> getData() async {
    int? hour;
    Response response =
        await get(Uri.parse("http://worldtimeapi.org/api/timezone/$region"));
    var recievedData = jsonDecode(response.body);

    if (recievedData != null) {
      hour = int.parse(
          recievedData["datetime"].split("T")[1].split(".")[0].split(":")[0]);

      if (hour < 18 && hour > 5) {
        image = "assets/day.png";
      } else {
        image = "assets/night.png";
      }

      if (hour < 12) {
        time =
            "${hour.toString()}:${recievedData["utc_datetime"].split("T")[1].split(".")[0].split(":")[1].toString()} AM";
      } else {
        hour = hour - 12;
        time =
            "${hour.toString()}:${recievedData["utc_datetime"].split("T")[1].split(".")[0].split(":")[1].toString()} PM";
      }

      timeZone = recievedData["timezone"];
    }
  }
}
