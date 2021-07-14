import 'package:flutter/material.dart';
import 'package:pinti_app/myProfile.dart';
import 'package:pinti_app/sepetim.dart';
import 'package:pinti_app/urun.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

    /*final imageUrl = await imageLink.getDownloadUrl();
    Image.network(imageUrl.toString());*/

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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => myProfile()));
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
                      // I'd rather use Image.network instead of using firestorage since we will be implementing web scraping scripts
                      // in the future in order to get images and prices.
                      // Image.network("https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/34014356/34014356-ce0d80.jpg"),
                      urun(8.0,"redbull.jpg", "Redbull Energy Drink","carrefour.png"),
                      urun(25.0,"colgate.jpg", "Colgate","carrefour.png"),
                      urun(3.75,"etigong.jpg", "Eti Gong","migros.png"),
                      urun(10.25,"monster.jpg", "Monster Energy Drink","migros.png"),
                      urun(9.50,"monster.jpg", "Monster Energy Drink","carrefour.png"),
                      urun(7.50,"obsesso.jpg", "Obsesso Coffee","carrefour.png"),
                      urun(8.50,"obsesso.jpg", "Obsesso Coffee","migros.png"),


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


Future<Widget> _getImage(BuildContext context, String imageName) async{
  Image image ;
  final value = await FireStorageService.loadImage(context, imageName);
  image =Image.network(
    value.toString(),
    fit: BoxFit.fill,
  );
  return image;
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

class FireStorageService extends ChangeNotifier{
  FireStorageService();
  static Future<String> loadImage(BuildContext context, String image) async{
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}