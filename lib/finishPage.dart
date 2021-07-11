import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pinti_app/sayfa1.dart';

class finishPage extends StatefulWidget {
  const finishPage({Key? key}) : super(key: key);

  @override
  _finishPageState createState() => _finishPageState();
}

class _finishPageState extends State<finishPage> {
  double _rating = 5.0;
  String _currentAnimation = '5+';

  void _onChanged(double value){
        setState((){
          var direction = _rating < value ? '+' : '-';
          _rating = value;
          _currentAnimation = '${value.round()}$direction';
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.deepPurple,
    body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Order complete!",style:
            TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            ),
            Text("How was your experience?",style:
            TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
            color: Colors.red),
                ),

              Container(
                  height: 250,
                  width: 300,
                  child: FlareActor('riveAssets/happiness_emoji.flr', //youtube CodeX flare animation
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: _currentAnimation,
                  )),
              Slider(
                value: _rating,
                min:1,
                max:5,
                divisions:4,
                onChanged: _onChanged,),
              Text(
                '$_rating',
                style: Theme.of(context).textTheme.headline4,
              ),
              ElevatedButton(
              child: Text("Siparişi Puanla!",style: TextStyle(fontSize: 25),),
              onPressed: (){
                print("Puanınız $_rating");
                sleep(Duration(seconds:2));
                Navigator.push(context, MaterialPageRoute(builder: (context) => sayfa1()));

              },
                style: ElevatedButton.styleFrom(
                primary: Colors.pink, //color:
                onPrimary: Colors.white, //textColor:
              ),
            ),
          ],
        )
    ),
    );
  }
}
