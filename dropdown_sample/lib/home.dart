import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            text: 'Home',
          ),
        ),
      ),
      body: const Center(
        child: Text('Welcome to Home!'),
      ),
    );
  }
}
