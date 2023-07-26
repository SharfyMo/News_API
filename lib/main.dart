import 'package:flutter/material.dart';
import 'package:flutter_application_location/pages/home.dart';
import 'package:flutter_application_location/pages/loading.dart';
import 'package:flutter_application_location/pages/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/location': (context) => const Location(),
        '/home2': (context) => const Home(),
      },
    );
  }
}
