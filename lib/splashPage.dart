import 'package:flutter/material.dart';
import 'package:pinti_app/login.dart';
import 'package:pinti_app/sepetim.dart';
import 'package:pinti_app/urun.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rive/rive.dart';
import 'dart:io';
import 'package:flare_flutter/flare_actor.dart';

class splashPage extends StatefulWidget {
  const splashPage({Key? key}) : super(key: key);

  @override
  _splashPageState createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  void initState() {
    super.initState();

    asyncInit();
  }

Future<void> asyncInit() async {
  await Future.delayed(Duration(seconds: 3));

  Navigator.of(context).pushReplacement(
      MaterialPageRoute(
      builder: (context) => login(title: "login page")));
}


  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
      backgroundColor: Color(0xFF9B01A5),  //since it has gradient i couldn't manage. just trying out new stuff
      body: Center(                        //never done any graphics or animations before so please don't judge too harshly :D
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: ekranYuksekligi / 1.5,
            width: ekranGenisligi / 1,
            child: Opacity(
              opacity: 0.8,
              child: RiveAnimation.asset(
                'riveAssets/pinti.riv',
                alignment: Alignment.center,
                fit: BoxFit.cover,

              ),
            ),
          ),
        ],
      ),
      ),
    );

  }
}
