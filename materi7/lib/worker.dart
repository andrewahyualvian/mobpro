import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materi7/bottom_sheet_getx.dart';

//Controller untuk mendemonstrasikan pengguna workers
class WorkerController extends GetxController {
  //Variabel reaktif yang akan kita monitor
  var count = 0.obs;

  void onInit() {
    //Memanggil worker setiap kali count berubah
    ever(count, (_) => print("ever: Count changed to $count"));

    //Memanggil worker hanya satu kali saat count berubah untuk pertama kalinya
    once(count, (_) => print("once: Count changed to $count"));

    //Memanggil worker setiap 2 detik, hanya jika ada perubahan pada count
    interval(count, (_) => print("interval: Count changed to $count"));

    super.onInit();
  }

  //fungsi untuk menambah nilai count
  void increment() {
    count++;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Workers Example"),
        ),
        body: WorkerExample(),
      ),
    );
  }
}

class WorkerExample extends StatelessWidget {
  //Menginisialisasi Controller menggunakan getx
  final WorkerController wc = Get.put(WorkerController());

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text("Count: ${wc.count}", style: TextStyle(fontSize: 24))),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: wc.increment,
              child: Text("Increment"),
          ),
        ],
      ),
    );
  }
}