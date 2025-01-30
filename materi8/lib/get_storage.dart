import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final GetStorage box = GetStorage();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get Storage Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Menyimpan data
                box.write('username', 'flutter User');
                Get.snackbar("Data", "Data disimpan"); // Tampilkan snackbar
              },
              child: Text("Simpan Data"),
            ),
            ElevatedButton(
              onPressed: () {
                // Mengambil Data
                String username = box.read('username') ?? 'Tidak ada data';
                Get.snackbar("Data", username); // Tampilkan snackbar
              },
              child: Text("Ambil Data"),
            ),
            ElevatedButton(
              onPressed: () {
                // Menghapus Data
                box.remove('username');
                Get.snackbar("Data", "Data dihapus"); // Tampilkan snackbar
              },
              child: Text("Hapus Data"),
            ),
          ],
        ),
      ),
    );
  }
}
