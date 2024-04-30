// ignore_for_file: file_names

import 'package:flutter/material.dart';

class UnityDisplay extends StatelessWidget {
  const UnityDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unity Display'),
      ),
      body: const Center(
        child: Text(
          'This is where Model shows',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
