import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Learning",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Linear Progress Indicator"),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Indeterminate Progress Indicator",
                  style: TextStyle(fontSize: 19),
                ),
                margin: EdgeInsets.all(20),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: Colors.purple,
                  minHeight: 5,
                ),
              ),
              Container(
                child: Text(
                  "Deterimate Progeress Indıcator",
                  style: TextStyle(fontSize: 19),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                    minHeight: 5,
                    value: value,
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: Text("Dowlod File"),
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white70, primary: Colors.green),
                  onPressed: () {
                    value = 0;
                    dowloadData();
                    setState(() {});
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void dowloadData() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (value == 1) {
          timer.cancel();
        } else {
          value = value + 0.1;
        }
      });
    });
  }
}
