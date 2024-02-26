import 'package:flutter/material.dart';
import 'Model/icerik.dart';
import 'Model/kategori.dart';
import 'Pages/kategori_page.dart';
import 'home.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Navigation extends StatefulWidget {
  final List<Kategori> kategoriListesi;
  final List<Icerik> icerikListesi;
  Navigation({required this.kategoriListesi,required this.icerikListesi});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  Widget getWidget({required int index,required List<Kategori> kategoriListesi,required List<Icerik>icerikListesi}){
      Widget widget;
      switch(index){
        case 0:
          widget=HomePage(kategoriListesi: kategoriListesi, icerikListesi: icerikListesi);
          break;
        default:
          widget=KategoriPage(kategori_index: index, icerikler: icerikListesi, kategoriler: kategoriListesi);
      }
      return widget;

    }
  int index=0;
  final items=[
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.home, color: Colors.white, size: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ana Sayfa', style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.work, color: Colors.white, size: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Creational', style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.build, color: Colors.white, size: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Structural', style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.psychology, color: Colors.white, size: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Behavioral', style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade300,
      child: SafeArea(
        top:false,
        child: Scaffold(
           bottomNavigationBar: CurvedNavigationBar(
            animationDuration: Duration(milliseconds:550),
            height: 60,
            backgroundColor: Colors.green,
            buttonBackgroundColor: Colors.green,
             color: Colors.green.shade300,
            items: items,
            index: index,
            onTap: (index) =>setState(() {this.index=index;}),
          ),

          body:
         getWidget(index: index, kategoriListesi: widget.kategoriListesi, icerikListesi: widget.icerikListesi),



    ),),
    );

 
  }
     
}