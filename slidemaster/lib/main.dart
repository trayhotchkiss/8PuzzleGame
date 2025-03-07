import 'package:flutter/material.dart';
import 'package:slidemaster/models/gamelogic.dart';
import 'widgets/puzzlegrid.dart';

void runTests() {
  // Example tiles configurations
  List<List<int?>> testPuzzles = [
    [1, 8, 2, null, 4, 3, 7, 6, 5], // Solvable configuration
    [8, 1, 2, null, 4, 3, 7, 6, 5], // Likely unsolvable configuration
    [1, 2, 3, 4, 5, 6, 7, 8, null] // Already solved, should be solvable
  ];

  for (var tiles in testPuzzles) {
    int inversions = GameLogic.countInversions(tiles);
    bool solvable = GameLogic.isSolvable(tiles);
    print("Testing tiles: $tiles");
    print("Inversions: $inversions, Solvable: $solvable\n");
  }
}

void main() {
  runApp(SlideMasterApp());
  runTests(); // Call test function after app starts
}

class SlideMasterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SlideMaster',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(155, 199, 142, 58),
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
