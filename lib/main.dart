import 'package:flutter/material.dart';
import 'package:teleplay_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.blue[400]),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
