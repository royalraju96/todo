import 'package:flutter/material.dart';
import 'package:todo/src/module/login/services/shared_pref.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                LocalStorage.logOut();
              },
              icon: const Icon(Icons.power_settings_new_outlined))
        ],
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
