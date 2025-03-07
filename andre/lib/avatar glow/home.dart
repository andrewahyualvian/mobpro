import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var faker = new Faker();

  String tanggal = DateTime.now().toIso8601String();

  int currentIndex = 0;

  Widget build(BuildContext context) {
    List<Widget> widgets =[
      ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage("https://picsum.photos/id/${870 + index}/200/300"),
            ),
            title: Text("${faker.person.name()}"),
            subtitle: Text("${DateFormat.yMMMMEEEEd().add_jms().format(DateTime.parse(tanggal))}"),
          ),
      ),
      Center(
        child: Text("MENU KE 2"),
      ),
      Center(
        child: Text("MENU KE 3"),
      ),
      Center(
        child: Text("MENU KE 4"),
      ),
      Center(
        child: Text("MENU KE 5"),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("FAKER"),
      ),
      body: widgets[currentIndex],
      bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          backgroundColor: Colors.red[900],
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          initialActiveIndex: 0,
          onTap: (int i) {
            setState(() {
              currentIndex = i;
            });
          },
      ),
    );
  }
}