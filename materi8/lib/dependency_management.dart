import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

//controller untuk manajemen state
class MyController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter++;
  }
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    //menyediakan controller menggunakan get.put()
    Get.put(MyController());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Manajemen Dependency dengan GetX")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return Text(
                    "Counter: ${Get.find<MyController>().counter}",
                    style: TextStyle(fontSize: 24),
                );
              }),
              ElevatedButton(
                  onPressed: (){
                    //mengubah nilai counter
                    Get.find<MyController>().increment();
                  },
                  child: Text("Increment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}