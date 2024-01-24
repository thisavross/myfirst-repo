import 'package:flutter/material.dart';

class CatLandingAnimation extends StatefulWidget {
  const CatLandingAnimation({super.key});

  @override
  _CatLandingAnimationState createState() => _CatLandingAnimationState();
}

class _CatLandingAnimationState extends State<CatLandingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: -100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cat landing animation'),
      ),
      body: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0.0, _animation.value),
              child: Image.asset(
                'assets/image/logo.jpg',
                width: 150.0,
                height: 150.0,
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
