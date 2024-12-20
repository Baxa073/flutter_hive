import 'package:flutter/material.dart';
import 'package:hive_db/db_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DBPage(),
    );
  }
}
