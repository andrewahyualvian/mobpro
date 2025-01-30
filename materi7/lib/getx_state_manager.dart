import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Controller for managing a list using GetX
class ListController extends GetxController {
  var items = <String>[].obs;

  void addItem(String item) {
    items.add(item);
  }

  void removeItem(int index) {
    items.removeAt(index);
  }
}

//Main
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("State Management Example")),
        body: Column(
          children: [
            Expanded(child: RxListExample()),
          ],
        ),
      ),
    );
  }
}

//RxList Example
class RxListExample extends StatelessWidget {
  final ListController listController = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = TextEditingController();

    return Column(
      children: [
        // Text input and button to add item
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: inputController,
                  decoration: InputDecoration(
                    hintText: "Enter item",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  if (inputController.text.isNotEmpty) {
                    listController.addItem(inputController.text);
                    inputController.clear();
                  }
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),

        // Reactive list display
        Expanded(
          child: Obx(() {
            return ListView.builder(
              itemCount: listController.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(listController.items[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      listController.removeItem(index);
                    },
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}