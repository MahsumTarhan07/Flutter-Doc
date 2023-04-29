import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx_kullanimi/SayacModel.dart';


class ikinciSayfa extends StatelessWidget {

  var SayacModelNesne = SayacModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "0",
            style: TextStyle(fontSize: 36),
          ),
          ElevatedButton(
            child: Text("Sayı Artır"),
            onPressed: (){
                SayacModelNesne.sayacArtir();
            },
          ),
          ElevatedButton(
            child: Text("Sayı Azalt"),
            onPressed: (){
              SayacModelNesne.sayacAzalt(2);
            },
          ),
        ],
      ),
    );
  }
}

class Observer extends SayacModel{
  var sayacModelNesne = SayacModel();
}
