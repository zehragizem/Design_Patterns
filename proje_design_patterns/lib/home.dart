import 'package:flutter/material.dart';


import 'Model/icerik.dart';
import 'Model/kategori.dart';
import 'db_operations.dart';
import 'navigation.dart';



class HomePage extends StatefulWidget {
  final List<Kategori> kategoriListesi;
  final List<Icerik> icerikListesi;
  HomePage({required this.kategoriListesi,required this.icerikListesi});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(
            child: Text("DESIGN PATTERNS",
            style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            ),
          ),
        ),
        body:SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "DESIGN PATTERNS NEDİR?",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Design Patterns(Tasarım Kalıpları), yazılım geliştirmede yaygın olarak karşılaşılan zorluklara yönelik geliştirilen,test edilen ve kanıtlanmış kod tasarımlarıdır. Yazılım geliştirme sürecinde ortaya çıkan genel problemlere çözümler sunarlar, bu çözümler birçok yazılım geliştiricisi tarafından zaman içinde deneme yanılma yoluyla elde edilmiştir. Tasarım kalıpları, hemen kullanmaya başlayabileceğiniz bir kütüphane veya çerçeve değildir. Daha önce birçok geliştiricinin üstesinden geldiği bir sorunla karşılaşıldığında kullanılması önerilen, yerleşik bir düşünme tekniğidir. Tasarım kalıpları,geliştiricilere yeniden kullanılabilir çözümler sunarak farklı projelere uygulanabilir ve zaman kazandırır.Geliştiricilerin daha temiz,daha okunabilir ve daha düzenli bir kod oluşturmalarına yardımcı olur. Bu sayede,yazılım tasarımındaki sorunları daha verimli ve etkili bir şekilde çözmeyi sağlar."
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      "images/designpatterns.png",
                      width: 420,
                      height: 400,
                    ),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.kategoriListesi.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.kategoriListesi[index].kategori_adi! + " NEDİR?",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          widget.kategoriListesi[index].kategori_icerik!,
                        ),
                        
                        
                  
                      );
                    },
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
      

      ),
    );
  }
}
// ------------------------------------------------
// Function: initState()
// Return Value: None
// Parameters: None
// Description: Initializes db
// ------------------------------------------------
