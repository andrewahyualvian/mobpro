import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Controller for GetX example
class CounterController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter++;
  }
}

//Main aplication
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("State Management Example")),
        body: Column(
          children: [
            StatelessExample(),
            StatefulExample(),
            GetXExample()
          ],
        ),
      ),
    );
  }
}

//Stateless Widget Example
class StatelessExample extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Text("Hello from Stateless Widget!"),
    );
  }
}

//Stateful Widget Example
class StatefulExample extends StatefulWidget {
  _StatefulExampleState createState() => _StatefulExampleState();
}
class _StatefulExampleState extends State<StatefulExample> {
  int counter = 0;
  
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: $counter'),
        ElevatedButton(
            onPressed: (){
              setState(() {
                counter++;
              });
            }, 
            child: Text("Increment Stateful")),
      ],
    );
  }
}

//GetX State Management Example
class GetXExample extends StatelessWidget {
  final CounterController c = Get.put(CounterController());
  
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Text('Counter: ${c.counter}')),
        ElevatedButton(
            onPressed: c.increment, 
            child: Text("Increment with GetX"))
      ],
    );
  }
}