import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(const ShopingApp());
}

class ShopingApp extends StatelessWidget {
  const ShopingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(title: 'Product Page'),
    );
  }
}
