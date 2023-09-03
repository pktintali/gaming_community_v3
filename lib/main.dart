import 'package:flutter/material.dart';
import 'my_home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => const MyHomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Gaming Community',
      theme: ThemeData(
        primaryColor: Colors.purple.shade700,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
