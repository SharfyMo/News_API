// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_location/chasses/allcountry.dart';
import 'package:flutter_application_location/chasses/getdata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Location(),
    );
  }
}

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    List manycountry = manycountryy;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 191, 191, 199),
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(146, 12, 16, 49),
          title: const Text(
            "Choose Location",
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: SizedBox(
          child: ListView.builder(
              padding: const EdgeInsets.all(7),
              itemCount: manycountry.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    onTap: () async {
                      Allcountris clickcountry = manycountry[index];
                      await clickcountry.getdata();

                      Navigator.pop(context, {
                        "time": clickcountry.timenow,
                        "country": clickcountry.country,
                        "timeimgday": clickcountry.isdaytime
                      });
                    },
                    title: Text(
                      manycountry[index].countryname,
                      style: const TextStyle(fontSize: 22),
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/${manycountry[index].flag}"),
                    ),
                  ),
                );
              }),
        ));
  }
}
