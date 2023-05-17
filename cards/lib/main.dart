import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Card",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Future<Widget> getImage() async {
    final Completer<Widget> completer = Completer();
    final url = '';
    final image = NetworkImage(url);

    final load = image.resolve(const ImageConfiguration());

    await Future.delayed(Duration(seconds: 2));

    final listener = new ImageStreamListener((ImageInfo info, isSync) async {
      print(info.image.width);
      print(info.image.height);

      completer.complete(Container(
          child: Image(
        image: image,
      )));
    });

    load.addListener(listener);
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Card Examples"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              child: Card(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                              leading: Icon(Icons.shop,color: Colors.cyan,),
                              title: Text("Man Shop"),
                              subtitle: Text("Man Shop Card")),
                          Container(
                            alignment: Alignment.center,
                            child: FutureBuilder<Widget>(
                              future: getImage(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text("Message ${snapshot.data}");
                                } else {
                                  return Text("LOADING");
                                }
                              },
                            ),
                          ),
                          ButtonBarTheme(
                              data: ButtonBarThemeData(),
                              child: ButtonBar(
                                children: <Widget>[
                                  TextButton(
                                    child: const Text("Add to Boomark"),
                                    onPressed: () {},
                                  ),
                                  TextButton(
                                    child: const Text("Show More"),
                                    onPressed: () {},
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                              leading: Icon(Icons.shop,color: Colors.pink,),
                              title: Text("Woman Shop"),
                              subtitle: Text("Woman Shop Card")),
                          Container(
                            alignment: Alignment.center,
                            child: FutureBuilder<Widget>(
                              future: getImage(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text("Message ${snapshot.data}");
                                } else {
                                  return Text("LOADING");
                                }
                              },
                            ),
                          ),
                          ButtonBarTheme(
                              data: ButtonBarThemeData(),
                              child: ButtonBar(
                                children: <Widget>[
                                  TextButton(
                                    child: const Text("Add to Boomark"),
                                    onPressed: () {},
                                  ),
                                  TextButton(
                                    child: const Text("Show More"),
                                    onPressed: () {},
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                              leading: Icon(Icons.shop,color: Colors.purpleAccent,),
                              title: Text("Kids Shop"),
                              subtitle: Text("Kids Shop Card")),
                          Container(
                            alignment: Alignment.center,
                            child: FutureBuilder<Widget>(
                              future: getImage(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text("Message ${snapshot.data}");
                                } else {
                                  return Text("LOADING");
                                }
                              },
                            ),
                          ),
                          ButtonBarTheme(
                              data: ButtonBarThemeData(),
                              child: ButtonBar(
                                children: <Widget>[
                                  TextButton(
                                    child: const Text("Add to Boomark"),
                                    onPressed: () {},
                                  ),
                                  TextButton(
                                    child: const Text("Show More"),
                                    onPressed: () {},
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                elevation: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
