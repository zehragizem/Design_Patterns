import 'package:flutter/material.dart';

import 'Model/icerik.dart';
import 'Model/kategori.dart';
import 'db_operations.dart';
import 'navigation.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late DbOperation dbOperations;
  List<Kategori> kategoriListesi=[];
  List<Icerik> icerikListesi=[];
  @override
  void initState() {
    super.initState();
    dbOperations = DbOperation();
    initializeData();
  } // end initState()

  Future<void> initializeData() async {
    print("başlatılıyor");
    await dbOperations.baslat();
    setState(() {
      kategoriListesi = dbOperations.kategoriListesi;
      icerikListesi = dbOperations.icerikListesi;
    });
    
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Navigation(kategoriListesi: kategoriListesi, icerikListesi: icerikListesi)
    );
  }
}
/*import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String _databasePath;
  late DbHelper db;

  @override
  void initState() {
    super.initState();
    db = DbHelper();
    db.baslat();
    _initDatabasePath();
  }

  Future<void> _initDatabasePath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    _databasePath = documentsDirectory.path;
    print('Database Path: $_databasePath');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Database Path'),
        ),
        body: Center(
          child: Text('Database Path: $_databasePath'),
        ),
      ),
    );
  }
}*/
//*******************************************************************
//*******************************************************************
//
// File : main.dart
// Author : Zehra Gizem DUMAN
// Project Name : Design Patterns info
// Operating Environment : Android / IOS / Windows
// Compiler : Flutter
// Date : 16 Feb 24
//
// Description :
//
// - Main of Patterns
//
// Inputs : None
//
// Outputs : None
//
// Process : None
//
// Assumption : None
//
// Warnings during compilation : None
//*******************************************************************
//*******************************************************************