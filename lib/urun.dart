
import 'package:flutter/material.dart';

class urun extends StatelessWidget {
  double? fiyat;
  String? image;
  String? urunAdi;

  urun(this.fiyat, this.image, this.urunAdi);

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);               //here we are trying to do multi platform
    final double ekranYuksekligi = ekranBilgisi.size.height; //support in order to achieve same look
    final double ekranGenisligi = ekranBilgisi.size.width;   //on multiple devices

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
              height: ekranYuksekligi/7,
              width: ekranGenisligi/3,
              child: Image.asset(image!)),
          Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0, top: 8.0),
            child: Text("$urunAdi",style: TextStyle(fontSize: ekranGenisligi/27),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
            child: Text("Price: $fiyat",style: TextStyle(fontSize: ekranGenisligi/20),),
          ),

          Container(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: MaterialButton(
                child:Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                  size: ekranGenisligi/11,
                ),
                onPressed: (){              //todo
                  print("Added to Cart!");
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}

