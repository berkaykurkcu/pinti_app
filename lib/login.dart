import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pinti_app/register.dart';
import 'package:pinti_app/sayfa1.dart';
import 'authentication.dart';

String email = "";
String password = "";
class login extends StatefulWidget {
  const login({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: SingleChildScrollView( // to get rid of pixel overflow, we made our Column scrollable
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: ekranYuksekligi/20,),
                child: SizedBox(
                    width: ekranGenisligi/2,
                    height: ekranYuksekligi/3,
                    child: Image.asset("resimler/logo.png")
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi/30),
                child: TextField(
                  onChanged: (value){
                    email=value;
                  },
                  decoration: InputDecoration(
                    hintText: "E-mail Address",
                    filled: true, fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi/30),
                child: TextField(
                  onChanged: (value){
                    password=value;
                  },
                  obscureText: true,                             //hide text
                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true, fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi/100),
                child: SizedBox(
                  width: ekranGenisligi/1.2,
                  height: ekranYuksekligi/12,
                  child: ElevatedButton(
                    child: Text("Log-In",style: TextStyle(fontSize: ekranGenisligi/18),),
                    onPressed: (){
                      AuthService.signIn(email,password, () {
                        print("Giriş yapıldı.");
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder:
                                (context) => sayfa1()));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink, //color:
                      onPrimary: Colors.white, //textColor:
                    ),
                  ),

                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi/100),
                child: SizedBox(
                  width: ekranGenisligi/1.5,
                  height: ekranYuksekligi/20,
                  child: ElevatedButton(
                    child: Text("Register",style: TextStyle(fontSize: ekranGenisligi/18),),
                    onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink, //color:
                      onPrimary: Colors.white, //textColor:
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("Yardım edildi");
                },
                child: Text(
                  "Help?",
                  style: TextStyle(fontSize: ekranGenisligi/25,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}