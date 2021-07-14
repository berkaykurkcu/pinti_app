import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class urun extends StatelessWidget {
  String? marketName;
  double? fiyat;
  String? image;
  String? urunAdi;

  urun(@required this.fiyat,
       @required this.image,
       @required this.urunAdi,
       @required this.marketName);


  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);               //here we are trying to do multi platform
    final double ekranYuksekligi = ekranBilgisi.size.height; //support in order to achieve same look
    final double ekranGenisligi = ekranBilgisi.size.width;   //on multiple devices

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          /*SizedBox(
              height: ekranYuksekligi/7,
              width: ekranGenisligi/3,
              child: Image.asset(image!)),*/

          SizedBox(
            width: ekranGenisligi/3,
            height: ekranYuksekligi/6,
            child: FutureBuilder<Widget>(
              future: _getImage(context, image!),
              builder: (context,snapshot){

                if(snapshot.hasError){
                  return Text('${snapshot.error}');
                }

                if(snapshot.connectionState == ConnectionState.done){
                  return Container(
                    width: MediaQuery.of(context).size.width/ 1.2,
                    height: MediaQuery.of(context).size.height/1.2,
                    child: snapshot.data,
                  );
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Container(
                    width: MediaQuery.of(context).size.width/ 1.2,
                    height: MediaQuery.of(context).size.height/1.2,
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },

            ),
          ),
          SizedBox(
            width: ekranGenisligi/9,
            height: ekranYuksekligi/17,
            child: FutureBuilder<Widget>(
              future: _getImage(context, marketName!),
              builder: (context,snapshot){

                if(snapshot.hasError){
                  return Text('${snapshot.error}');
                }

                if(snapshot.connectionState == ConnectionState.done){
                  return Container(
                    width: MediaQuery.of(context).size.width/ 1.2,
                    height: MediaQuery.of(context).size.height/1.2,
                    child: snapshot.data,
                  );
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Container(
                    width: MediaQuery.of(context).size.width/ 1.2,
                    height: MediaQuery.of(context).size.height/1.2,
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },

            ),
          ),

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
  Future<Widget> _getImage(BuildContext context, String imageName) async{
    Image image ;
    final value = await FireStorageService.loadImage(context, imageName);
    image =Image.network(
      value.toString(),
      fit: BoxFit.fill,
    );
    return image;
  }
}


class FireStorageService extends ChangeNotifier{
  FireStorageService();
  static Future<String> loadImage(BuildContext context, String image) async{
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}