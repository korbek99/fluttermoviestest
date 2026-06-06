import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/appstrings.dart';



class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Appstrings.infoTitle),
        backgroundColor: Colors.yellow,
      ),
      body: const Center(
        child: Text(Appstrings.infobody),
      ),
    );
  }
}