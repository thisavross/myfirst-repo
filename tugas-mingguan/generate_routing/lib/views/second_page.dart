import 'package:flutter/material.dart';

class SecondsPage extends StatelessWidget {
  const SecondsPage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("seconds page"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Text('menuju halaman ke 1'),
          ),
        ));
  }
}
