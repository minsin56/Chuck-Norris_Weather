import 'package:dafaq_is_the_weather/Routes/HomePage.dart';
import 'package:dafaq_is_the_weather/Routes/SettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

       SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (CTX) => HomePage(),
        'Settings': (CTX) => SettingsPage()
      },
      initialRoute: "/",
    );
  }
}
