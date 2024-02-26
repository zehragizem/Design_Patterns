import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'icerik.dart';
import 'kategori.dart';

class DbHelper {
  late Database db;

  Future<void> baslat() async {
    try {
      var documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, "patterns.db");
      db = await databaseFactoryFfi.openDatabase(path);

      await db.execute(
        "CREATE TABLE if not exists kategoriler("
            "kategori_id INTEGER PRIMARY KEY, "
            "kategori_adi TEXT NOT NULL, "
            "kategori_icerik TEXT NOT NULL)",
      );
      await db.execute(
        "CREATE TABLE if not exists patterns("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "kategori_id INTEGER NOT NULL, "
            "baslik TEXT NOT NULL, "
            "icerik TEXT NOT NULL, "
            "FOREIGN KEY(kategori_id) REFERENCES kategoriler(kategori_id)"
            "ON DELETE CASCADE"
            ")",

      );
      print("Tablolar oluşturuldu");
    } catch (e) {
      print("Error initializing database: $e");
      // Handle the error gracefully
    }
  }

  Future<int> ekle(String tabloAdi, var eklenen) async {
    return db.insert(tabloAdi, eklenen.toMap());
  }

  Future<List<Icerik>> getIcerik() async {
    var kayitlar = await db.query("patterns");
    return kayitlar.map((e) => Icerik.fromMap(e)).toList();
  }

  Future<List<Kategori>> getKategoriler() async {
    var kayitlar = await db.query("kategoriler");
    return kayitlar.map((e) => Kategori.fromMap(e)).toList();
  }

  Future<void> deleteAll(String tabloAdi) async {
    await db.delete(tabloAdi);
  }
}
