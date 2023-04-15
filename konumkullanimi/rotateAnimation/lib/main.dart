import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> rotateAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);

    rotateAnimation = Tween(begin: 2*pi, end: pi/2).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  // dispose ugulama arka plana giderse durudur
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.wb_cloudy,
              color: Colors.white,
              size: 128,
            ),
            Transform.rotate(
              angle: rotateAnimation.value,
              child: Text(
                "Hava Durumu",
                style: TextStyle(color: Colors.white, fontSize: 37),
              ),
            ),
            SizedBox(
              width: 250,
              height: 60,
              child: ElevatedButton(
                child: Text(
                  "Başla",
                  style: TextStyle(color: Colors.black, fontSize: 21),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                onPressed: () {
                  animationController.forward();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
