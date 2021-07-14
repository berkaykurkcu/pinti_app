import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'login.dart';

class myProfile extends StatefulWidget {
  const myProfile({Key? key}) : super(key: key);

  @override
  _myProfileState createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  var rating = 3.0;

  @override
  Widget build(BuildContext context) {

    //calling the text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    //getting the size of the device
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Padding(
                  padding: const EdgeInsets.only(top: 22.0,bottom: 10.0),
                  child: SizedBox(
                      width: size.width/2,
                      child: Image.asset("resimler/logo.png")
                  ),
                ),
              RichText(text: TextSpan(
                style: TextStyle(fontSize: 25),
                children: [
                  TextSpan(text: 'Your '),
                  TextSpan(text: 'INFO', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,),
                  ),
                ]
              ),
              ),

                Padding(
                  padding: EdgeInsets.all(size.width/30),
                  child: TextField(

                    decoration: InputDecoration(
                      hintText: "$email",
                      filled: true, fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.width/30),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "$password",
                      filled: true, fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.width/30),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Address",
                      filled: true, fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ),

              ]
        ),
          ),
    ),
      ),


    );
  }
}

