import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_db/services/database_service.dart';

class DBPage extends StatefulWidget {
  const DBPage({super.key});

  @override
  State<DBPage> createState() => _DBPageState();
}

class _DBPageState extends State<DBPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map data = {};

  void save() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    HiveService.storeInfo(email: email, password: password);
  }

  void getData() {
    var data = HiveService.getData();
    setState(() {
      this.data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('DB page'),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                save();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                "SAVE",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                getData();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                "GET DATA",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              data['email'] ?? '',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              data["password"] ?? '',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
