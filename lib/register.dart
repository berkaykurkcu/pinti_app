import 'package:flutter/material.dart';
import 'package:pinti_app/login.dart';

import 'authentication.dart';
String email = "";
String password = "";
class RegisterPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //calling the text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    //getting the size of the device
    Size size = MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar( //keeping this section in case user clicks on Register accidentally
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(""),
      ),
      body: Center(
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(size.width/30),
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
                  padding: EdgeInsets.all(size.width/30),
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


                ElevatedButton(
                  child: Text("Register",style: TextStyle(fontSize: size.width/18),),
                  onPressed: (){
                    AuthService.register(
                    email: email,
                    password: password,
                    navigator: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                   builder: (context) => login(title: 'hey',))
                         );
                       },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple
                  )),
              ],
            )),
      ),
    );
  }
}
