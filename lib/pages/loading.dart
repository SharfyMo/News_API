// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_location/chasses/getdata.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Loading(),
    );
  }
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getdatta() async {
    Allcountris onecountry =
        Allcountris(countryname: "Egypt", flag: "egypt", link: 'Africa/Cairo');
    await onecountry.getdata();
    Navigator.pushReplacementNamed(context, '/home2', arguments: {
      "time": onecountry.timenow,
      "country": onecountry.country,
      "timeimgday": onecountry.isdaytime
    });
  }

  @override
  void initState() {
    super.initState();
    getdatta();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SpinKitFadingCircle(
              color: Colors.black,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
