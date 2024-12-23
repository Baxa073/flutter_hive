import 'package:flutter/material.dart';
import 'package:hive_db/services/database_service.dart';

import 'model/user_model.dart';

class DBPage extends StatefulWidget {
  const DBPage({super.key});

  @override
  State<DBPage> createState() => _DBPageState();
}

class _DBPageState extends State<DBPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  Map data = {};

  void save() {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    HiveService.storeInfo(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);

    User user = User(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
    HiveService.saveObject(obj: user, objKey: "user");
  }

 void getUser() {
  User? user = HiveService.getObject(objectKey: "user");
  if (user == null) {
    setState(() {
      data['firstName'] = "No first name found";
      data['lastName'] = "No last name found";
      data['email'] = "No email found";
      data['password'] = "No password found";
    });
  } else {
    setState(() {
      data['firstName'] = user.firstName;
      data['lastName'] = user.lastName;
      data['email'] = user.email;
      data['password'] = user.password;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('DB '),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: firstNameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'First Name',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: lastNameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Last Name',
            ),
          ),
          const SizedBox(
            height: 20,
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
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              HiveService.deleteObject(objectKey: "user");
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text(
              "DELETE DATA",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              getUser();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text(
              "GET DATA",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            data['firstName'] ?? '',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data['lastName'] ?? '',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          Text(
            data['email'] ?? '',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data["password"] ?? '',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
