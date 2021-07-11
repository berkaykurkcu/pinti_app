import 'package:flutter/material.dart';
import 'package:pinti_app/sepetim.dart';
import 'package:pinti_app/urun.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rive/rive.dart';

class splashPage extends StatefulWidget {
  const splashPage({Key? key}) : super(key: key);

  @override
  _splashPageState createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {

  @override
  void initState() {
    super.initState();

    
  }


  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Container(

    );
  }
}
