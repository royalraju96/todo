import 'package:flutter/material.dart';
import 'package:todo/src/module/login/services/shared_pref.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    label: Text('Email*'), border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    label: Text('Password*'), border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    // final response = await FirebaseAuth.instance
                    //     .signInWithEmailAndPassword(
                    //         email: emailController.text,
                    //         password: passwordController.text);
                    LocalStorage.saveUserId('12345');
                  },
                  child: const Text('Sign In'))
            ],
          ),
        ),
      ),
    );
  }
}
