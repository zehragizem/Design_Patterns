import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../Model/icerik.dart';
import '../Model/kategori.dart';
import 'icerik_detay.dart';




class KategoriPage extends StatefulWidget {
  final int kategori_index;
  final List<Kategori> kategoriler;
  final List<Icerik> icerikler;
  KategoriPage({required this.kategori_index, required this.icerikler, required this.kategoriler});

  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Kategori id'sine göre kategori adını ve ilgili içerikleri bulma
    String kategoriAdi = "";
    List<Icerik> iceriklerListesi = [];

    for (var kategori in widget.kategoriler) {
      if (kategori.kategori_id == widget.kategori_index) {
        kategoriAdi = kategori.kategori_adi!;
        break;
      }
    }

    for (var icerik in widget.icerikler) {
      if (icerik.kategori_id == widget.kategori_index) {
        iceriklerListesi.add(icerik);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            kategoriAdi,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        
    
      ),




      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: iceriklerListesi.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Row(
                      children: [
                        Text(iceriklerListesi[index].baslik!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ],
                    ),
                    subtitle: Text(
                      iceriklerListesi[index].icerik!.length > 180
                          ? iceriklerListesi[index].icerik!.substring(0, 180) + "..."
                          : iceriklerListesi[index].icerik!,
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IcerikDetaySayfasi(
                            icerik: iceriklerListesi[index],
                            kategori_adi: kategoriAdi,
                          ),
                        ),
                      );
                    },
        
        
                  );
        
                },
        
        
        
            ),
            SizedBox(height: 15),
        
        
        
          ],
        
        ),
      )


    );
  }
}
