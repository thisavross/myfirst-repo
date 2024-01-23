import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sanber Flutter",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 40, // Adjust the height as needed
            ),
            Image.asset(
              "assets/flutter.png",
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                hintText: "Username",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                hintText: "Password",
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Forgot Password"),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Login"),
              ),
            ),
            Row(
              children: [
                Text("don't have account?"),
                TextButton(
                  onPressed: () {},
                  child: Text("register"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}