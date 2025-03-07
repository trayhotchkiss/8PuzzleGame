import 'package:flutter/material.dart';

class PuzzleTile extends StatelessWidget {
  final int number;
  final VoidCallback onTap;

  PuzzleTile({required this.number, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(number.toString(), style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
