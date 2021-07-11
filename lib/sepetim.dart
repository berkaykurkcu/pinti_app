import 'package:flutter/material.dart';
import 'package:pinti_app/finishPage.dart';

class sepetim extends StatelessWidget {
  const sepetim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: SizedBox(
              width: 200.0,
              height: 100.0,
              child: ElevatedButton(
                  child: Text("I added everything!",style: TextStyle(fontSize: 18),),
                    onPressed: (){
                      print("Sepet tamamlandı.");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => finishPage()));
    },
    ),
    ),
          ),
            ]
      ),
    );
  }
}
