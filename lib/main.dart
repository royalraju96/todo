import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/module/home/home.dart';
import 'package:todo/src/module/login/services/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool isUserLoggedIn = false;

  @override
  void initState() {
    userId();
    super.initState();
  }

  void userId() async {
    final userId = await LocalStorage.getUserId();

    if (userId.isEmpty) {
      setState(() {
        isUserLoggedIn = false;
      });
    } else {
      setState(() {
        isUserLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
