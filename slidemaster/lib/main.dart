import 'package:flutter/material.dart';
import 'widgets/puzzlegrid.dart';

void main() => runApp(SlideMasterApp());

class SlideMasterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SlideMaster',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(155, 244, 67, 54),
          elevation: 10,
          shadowColor: Color(0x00000000),
          foregroundColor: Color.fromARGB(234, 70, 13, 13),
          title: Text('SlideMaster'),
        ),
        body: PuzzleGrid(),
      ),
    );
  }
}
