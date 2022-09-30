import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/index/index.dart';
import 'modules/index/indexController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Sprint 3 Flutter',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => IndexController(),
        child: const HomePage(),
      ),
    );
  }
}
