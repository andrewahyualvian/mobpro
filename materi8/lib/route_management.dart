import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigasi dengan Getx")),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              //pindah ke halaman kedua menggunakan Getx
              Get.to(SecondPage());
            }, 
            child: Text("Pindah kehalaman kedua")),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman kedua")),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              //kembali kehalaman pertama
              Get.back();
            }, 
            child: Text("Kembali kehalaman pertama")),
      ),
    );
  }
}