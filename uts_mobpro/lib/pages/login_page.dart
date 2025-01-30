import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Variabel untuk mendeteksi apakah mouse sedang hover pada tombol
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon shield dengan centang
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.shield, size: 100, color: Colors.deepOrange),
                  Icon(Icons.check, size: 40, color: Colors.white),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Jadwalku",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Selamat Datang\nAkhul Adib Islamuddin (4122006) - Kelas A",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.deepOrange),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              // Tombol login dengan MouseRegion untuk efek hover
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHovered = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHovered = false;
                  });
                },
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isHovered ? Colors.deepOrange : Colors.deepOrange,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("or", style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.g_mobiledata, color: Colors.red),
                label: Text("Sign in with Google Account"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.deepOrange),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.apple, color: Colors.black),
                label: Text("Sign in with Apple ID"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.deepOrange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
