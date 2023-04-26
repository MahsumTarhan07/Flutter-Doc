import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Completer<GoogleMapController> haritaKontrol = Completer();

  var baslangicKonum =
      CameraPosition(target: LatLng(38.7412482, 26.1844276), zoom: 4);

  List<Marker> isartler = <Marker>[];

  Future<void> konumuGit() async{
      GoogleMapController controller = await haritaKontrol.future;

      var gidilecekIsaret = Marker(
        markerId: MarkerId("Id"),
        position: LatLng(41.0039643,28.4517462),
        infoWindow: InfoWindow(title: "İstanbul",snippet: "Evim"),
      );

      setState(() {
        isartler.add(gidilecekIsaret);
      });
      
      var gidilecekKonum = CameraPosition(target: LatLng(41.0039643,2845174620),zoom: 8);
      controller.animateCamera(CameraUpdate.newCameraPosition(gidilecekKonum));
  }
//  AIzaSyDNVMQPDHKuDPNVyahnYlNTeoQNQdR5oHw
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          SizedBox(
            width: 400,
            height: 300,
            child: GoogleMap(
              
              mapType: MapType.normal,
              initialCameraPosition: baslangicKonum,
              markers: Set<Marker>.of(isartler),
              onMapCreated: (GoogleMapController controller) {
                haritaKontrol.complete(controller);
              },
            ),
          ),
          ElevatedButton(
            child: Text("Konuma Git"),
            onPressed: (){
                konumuGit();
            },
          )
        ],
      )),
    );
  }
}
