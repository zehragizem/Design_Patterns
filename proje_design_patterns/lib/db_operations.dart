import 'package:flutter/material.dart';
import 'Model/db_helper.dart';
import 'Model/icerik.dart';
import 'Model/kategori.dart';
import 'db_operations.dart';
import 'navigation.dart';

class DbOperation {
  late DbHelper dbHelper=DbHelper();
  List<Icerik> icerikListesi = [];
  List<Kategori>kategoriListesi=[];

  Future<void> baslat() async{
    await dbHelper.baslat();
    await icerikEkle();
  }


  Future<void> icerikEkle() async {
    await dbHelper.deleteAll("patterns");
    await dbHelper.deleteAll("kategoriler");
    List<Icerik> kayitlarListesi = await dbHelper.getIcerik();
    List<Kategori>kategoriListesi=await dbHelper.getKategoriler();
  
    if (kayitlarListesi.isEmpty) {
      print("Patterns tablosu boş, kayıtlar ekleniyor.");
      for (int i = 0; i < Icerik.eklenenler.length; i++) {
        await dbHelper.ekle("patterns",Icerik.eklenenler[i]); 
      }
    }
    else
      print("patterns tablosu dolu"); 

    if(kategoriListesi.isEmpty){
      print("Kategoriler tablosu boş, kayıtlar ekleniyor.");
      for (int i = 0; i < Kategori.liste.length; i++) {
        await dbHelper.ekle("kategoriler",Kategori.liste[i]); 
      }
    }
    else
      print("kategoriler tablosu dolu");
   
    await icerikleriAl();
  }

  Future<void> icerikleriAl() async {
    icerikListesi = await dbHelper.getIcerik();
    kategoriListesi=await dbHelper.getKategoriler();
    print(icerikListesi.length); 
    print(kategoriListesi.length);
  }

}