import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materi7/bottom_sheet_getx.dart';

class ReactiveController extends GetxController {
  var name = "User".obs;

  void changeName(String newName) {
    name.value = newName;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Reactive Variables Example")),
        body: ReactiveExample(),
      ),
    );
  }
}

class ReactiveExample extends StatelessWidget {
  final ReactiveController rc = Get.put(ReactiveController());

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text("Name: ${rc.name}")),
          TextField(
            onChanged: rc.changeName,
            decoration: InputDecoration(labelText: "Enter name"),
          )
        ],
      ),
    );
  }
}