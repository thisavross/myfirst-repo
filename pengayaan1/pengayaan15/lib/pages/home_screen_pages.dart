import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen go'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/navbar'),
          child: const Text('go to the details screen'),
        ),
      ),
    );
  }
}
