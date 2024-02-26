import 'package:flutter/material.dart';
import '../Model/icerik.dart';


// Icerik sınıfınızın olduğu yolu düzenleyin

class IcerikDetaySayfasi extends StatelessWidget {
  final Icerik icerik;
  final String kategori_adi;
  IcerikDetaySayfasi({required this.icerik,required this.kategori_adi});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    kategori_adi,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                ),
              ],
            ),


           leading: IconButton(
             icon:Icon(Icons.arrow_back),
             onPressed:()=> Navigator.pop(context),)
          ),





        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  icerik.baslik!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height:3),
                Text(
                  icerik.icerik!,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
