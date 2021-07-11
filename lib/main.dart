import 'package:flutter/material.dart';
import 'package:pinti_app/login.dart';
import 'package:pinti_app/sayfa1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinti_app/splashPage.dart';
import 'authentication.dart';

/*Future <void> asyncInit() async{
  await Firebase.initializeApp();
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //instead of splash screen we went with this method
  await Firebase.initializeApp();            //we know it's bad for our app start up times
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashPage(),
    );
  }
}



