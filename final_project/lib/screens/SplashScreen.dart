// ignore_for_file: unused_import, library_private_types_in_public_api

import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:final_project/screens/UnityDisplay.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.repeat(reverse: true); // Repeat the animation

    // Start a timer to navigate to UnityDisplay after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UnityDisplay()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedBubbles(animation: _animation),
            Positioned.fill(
              child: Center(
                child: FadeTransition(
                  opacity: _animation,
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBubbles extends StatelessWidget {
  final Animation<double> animation;
  const AnimatedBubbles({required this.animation, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Stack(
          children: List.generate(10, (index) {
            // Generate random coordinates for bubbles
            final double x = Random().nextDouble() * MediaQuery.of(context).size.width;
            final double y = Random().nextDouble() * MediaQuery.of(context).size.height;
            final double size = Random().nextDouble() * 20 + 10; // Random size between 10 and 30

            return Positioned(
              left: x,
              top: y - size * animation.value, // Adjust Y position based on animation value
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.5 - animation.value * 0.5),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
