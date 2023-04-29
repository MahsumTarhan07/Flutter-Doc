import 'package:flutter/material.dart';
import 'package:mobx_kullanimi/ikinciSayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Anasayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("0",style: TextStyle(fontSize: 36),),
            ElevatedButton(
              child: Text("Geçiş Yap"),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> ikinciSayfa()));
              },
            )
          ],
        ),
      ),
    );
  }
}
