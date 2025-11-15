import 'package:flutter/material.dart';

import '../widgets/app_row_widget.dart';

class CountersScreen extends StatelessWidget {
  const CountersScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppRow(btnBackground: Colors.green,mainBackground: Colors.lightGreen,index: 0),
          AppRow(btnBackground: Colors.blue,mainBackground: Colors.lightBlueAccent,index: 1),
          AppRow(btnBackground: Colors.red,mainBackground: Colors.redAccent, index: 2),
          AppRow(btnBackground: Colors.orange,mainBackground: Colors.orangeAccent, index: 3),
          AppRow(btnBackground: Colors.yellow,mainBackground: Colors.yellowAccent, index: 4),
        ],
      ),
    );
  }
}