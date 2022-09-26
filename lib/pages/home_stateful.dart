import 'dart:math';

import 'package:flutter/material.dart';
import 'package:restfull_api/models/http_stateful.dart';

class HomeStateful extends StatefulWidget {
  HomeStateful({Key? key}) : super(key: key);

  @override
  State<HomeStateful> createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  HttpStateful dataResult = HttpStateful();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GET - STATEFUL'),
        ),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              imageProfile((dataResult.ava == null)
                  ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                  : dataResult.ava.toString()),
              const SizedBox(height: 20),
              displayText(
                  (dataResult.id == null) ? "ID" : dataResult.id.toString()),
              displayText((dataResult.name == null)
                  ? "Name"
                  : dataResult.name.toString()),
              displayText((dataResult.email == null)
                  ? "Email"
                  : dataResult.email.toString()),
              const SizedBox(height: 50),
              getButton(),
            ],
          ),
        ));
  }

  ClipRRect imageProfile(String linkAvatar) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 100,
        width: 100,
        child: Image.network(
          linkAvatar,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  FittedBox displayText(String textContent) {
    return FittedBox(
      child: Text(
        textContent,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  OutlinedButton getButton() {
    return OutlinedButton(
      child: const Text("GET DATA"),
      onPressed: getData,
    );
  }

  void getData() {
    HttpStateful.connectAPI((1 + Random().nextInt(10)).toString())
        .then((value) {
      setState(() {
        dataResult = value;
      });
    });
  }
}
