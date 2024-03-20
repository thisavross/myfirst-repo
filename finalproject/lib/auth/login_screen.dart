import 'package:finalproject/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/auth/signin_screen.dart';

import '../main.dart';

import 'package:finalproject/auth/firebase_service/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthScreenPage extends StatefulWidget {
  const AuthScreenPage({super.key});

  @override
  State<AuthScreenPage> createState() => _AuthScreenPageState();
}

class _AuthScreenPageState extends State<AuthScreenPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final FirebaseAuthServices _auth = FirebaseAuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auth Page"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Column(
            children: [
              textField(title: "Email", controller: emailController),

              /// Password Textfield
              textField(title: "Password", controller: passController),

              ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passController.text);
                  },
                  child: Text("Register")),
              ElevatedButton(
                  onPressed: () {
                    signIn();
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }

  Widget textField({
    required String title,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: title,
        ),
        controller: controller,
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  void signIn() async {
    String username = emailController.text;
    String password = passController.text;

    User? user = await _auth.signInWithEmailAndPassword(username, password);

    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      print("Some error");
    }
  }
}
