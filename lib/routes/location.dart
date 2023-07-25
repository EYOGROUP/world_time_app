// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time_app/classes/getdata-class.dart';

class Location extends StatelessWidget {
  static String id = "/location";
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    List<AllCountries> allCountries = [
      AllCountries(
          region: "Africa/Casablanca",
          countryName: "Morocco - Casablanca",
          flag: "morocco.png"),
      AllCountries(
          region: "Africa/Tunis",
          countryName: "Tunisia - Tunis",
          flag: "tunisia.png"),
      AllCountries(
          region: "Africa/Cairo",
          countryName: "Egypt - Cairo",
          flag: "egypt.png"),
      AllCountries(
          region: 'Africa/Algiers',
          countryName: 'Algeria - Algiers',
          flag: 'algeria.png'),
      AllCountries(
          region: 'Australia/Sydney',
          countryName: 'Australia - Sydney',
          flag: 'australia.png'),
      AllCountries(
          region: 'America/Toronto',
          countryName: 'Canada - Toronto',
          flag: 'canada.png'),
      AllCountries(
          region: 'Asia/Riyadh',
          countryName: '	Saudi Arabia - Riyadh',
          flag: 'sa.png'),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(48, 86, 117, 1),
        title: Text("Choose Location"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: allCountries.length,
        itemBuilder: (context, index) {
          return CountryCard(
            flag: allCountries[index].flag as String,
            countryName: allCountries[index].countryName as String,
            region: allCountries[index].region as String,
          );
        },
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  String region;
  String countryName;
  String flag;
  CountryCard(
      {super.key,
      required this.region,
      required this.flag,
      required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        onTap: () async {
          AllCountries country = AllCountries(region: region);
          await country.getData();
          if (context.mounted) {
            Navigator.pop(context, {
              "timezone": country.timeZone,
              "time": country.time,
              "image": country.image
            });
          }
        },
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/$flag"),
        ),
        title: Text(countryName),
      ),
    );
  }
}
