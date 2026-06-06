import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
        backgroundColor: Colors.yellow,
      ),
      body: const Center(
        child: Text('Welcome to the Info View!'),
      ),
    );
  }
}