import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restfull_api/models/http_provider.dart';
import 'package:restfull_api/pages/home_stateful.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => HttpProvider(),
        child: HomeStateful(),
      ),
    );
  }
}
