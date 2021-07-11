import 'package:flutter/material.dart';
import 'package:pinti_app/sepetim.dart';
import 'package:pinti_app/urun.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'authentication.dart';


class sayfa1 extends StatefulWidget {
  const sayfa1({Key? key}) : super(key: key);

  @override
  _sayfa1State createState() => _sayfa1State();
}

class _sayfa1State extends State<sayfa1> {
  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 22.0,bottom: 10.0),
              child: SizedBox(
                  width: ekranGenisligi/2,
                  child: Image.asset("resimler/logo.png")
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi/7,
                    child: TextButton(
                      style:TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        )
                        ,),
                      child: Yazi("My Profile", ekranGenisligi/25),
                      onPressed: (){
                        print("Profile Gidildi!");
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi/7,
                    child: TextButton(
                      child: Icon(
                        Icons.shopping_bag,
                      ),
                      style:TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: (){
                        print("Sepete Gidildi!");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => sepetim()));
                      },
                    ),

                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    AuthService.signOut();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(ekranYuksekligi/100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(                         //wrapped so it doesn't overflow
                    direction: Axis.horizontal,
                    spacing: 8.0,               //gap between adjacent chips
                    runSpacing: 4.0,            //gap between lines
                    children: [
                      urun(8.0,"resimler/redbull.jpg", "Redbull Energy Drink"),
                      urun(25.0,"resimler/colgate.jpg", "Colgate"),
                      urun(3.75,"resimler/etigong.jpg", "Eti Gong"),
                      urun(9.50,"resimler/monster.jpg", "Monster Energy Drink"),
                      urun(7.50,"resimler/obsesso.jpg", "Obsesso Coffee"),


                   ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Yazi extends StatelessWidget {
  String? icerik;
  double? yaziBoyut;

  Yazi(this.icerik, this.yaziBoyut); //constructors in order to get icerik and yaziboyutu

  @override
  Widget build(BuildContext context) {
    return Text(
      icerik!,
      style: TextStyle(fontSize: yaziBoyut),);
  }
}