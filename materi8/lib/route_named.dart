import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/second', page: () => SecondPage()),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Route named dengan Getx")),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              //Menggunakan route named untuk navigasi
              Get.toNamed('/second');
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