import 'package:bloc_kullanimi/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ikinciSayfa extends StatelessWidget {
  const ikinciSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İkinci Sayfa"),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>SayacCubit()),
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<SayacCubit,int>(
                builder: (context,sayacDegeri){
                  return Text("$sayacDegeri",style: TextStyle(fontSize: 36),);
                },
              ),
              Text("0",style: TextStyle(fontSize: 37),),
              ElevatedButton(
                child: Text("Sayac Artır"),
                onPressed: (){
                    context.read<SayacCubit>().sayacArtir();
                },
              ),
              ElevatedButton(
                child: Text("Sayac Azalt"),
                onPressed: (){
                  context.read<SayacCubit>().sayacAzalt(2);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}


