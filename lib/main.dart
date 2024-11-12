import 'package:flutter/material.dart';
import 'package:netflix/screens/splash_scren.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        // scaffoldBackgroundColor: Colors.grey[900],
        brightness: Brightness.dark,

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[800],
          elevation: 0,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Updated to bodyMedium
        ),
      ),
      home: SplashScreen(),
    );
  }
}
