import 'package:flutter/material.dart';
import 'package:learningm/page/home/drawer.dart';

class Deshboard extends StatelessWidget {
  const Deshboard({Key? key}) : super(key: key);
  static const String routeName = '/deshboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrowerF(),
    );
  }
}
