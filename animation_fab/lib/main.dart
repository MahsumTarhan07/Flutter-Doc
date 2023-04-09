import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  late AnimationController animationController;

  late Animation<double> scaleAnimation;
  late Animation<double> rotateAnimation;

  bool fabStatus = false;



  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 200),vsync: this);

    scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController)..addListener(() {
      setState(() {

      });
    });

    rotateAnimation = Tween(begin: 0.0, end: pi /1).animate(animationController)..addListener(() {
      setState(() {

      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fab Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Transform.scale(
            scale: scaleAnimation.value,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: (){

                },
                tooltip: 'Fab 1',
                backgroundColor: Colors.blue,
                child: Icon(Icons.camera_alt),
              ),
            ),
          ),
          Transform.rotate(
            angle: rotateAnimation.value,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: (){

                },
                tooltip: 'Fab 2',
                backgroundColor: Colors.purple,
                child: Icon(Icons.account_circle_rounded),
              ),
            ),
          ),
          Transform.rotate(
            angle: rotateAnimation.value,
            child: FloatingActionButton(
              onPressed: (){
                  if(fabStatus){
                    animationController.reverse();
                    fabStatus = false;
                  }else{
                    animationController.forward();
                    fabStatus = true;
                  }
              },
              tooltip: 'Fab 3',
              backgroundColor: Colors.black87,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
