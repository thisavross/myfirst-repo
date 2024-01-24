import 'package:flutter/material.dart';

class InfiniteLoopAnimationExample extends StatefulWidget {
  const InfiniteLoopAnimationExample({super.key});

  @override
  State<InfiniteLoopAnimationExample> createState() =>
      _InfiniteLoopAnimationExampleState();
}

class _InfiniteLoopAnimationExampleState
    extends State<InfiniteLoopAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('infinite loop animation example'),
      ),
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'spinning',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
