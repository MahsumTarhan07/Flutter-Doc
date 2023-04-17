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
      title: "Scrool Bar",
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List items = List.generate(30, (index) => "Child items $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Flutter Scroolbar Examples",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Scrollbar(
              child: ListView.builder(itemBuilder: (context, index) {
                return Card(
                  child: Material(
                    child: ListTile(
                      title: Text(
                        items[index],
                        style: const TextStyle(color: Colors.white70),
                      ),
                      tileColor: Colors.lightBlue,
                    ),
                  ),
                );
              },
              itemCount: items.length,
              ),
              isAlwaysShown: true,
              thickness: 10,
            ),
          ),
        ));
  }
}
