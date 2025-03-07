import 'package:flutter/material.dart';
import 'package:slidemaster/widgets/puzzletile.dart';
import 'package:slidemaster/models/gamelogic.dart';

class PuzzleGrid extends StatefulWidget {
  @override
  _PuzzleGridState createState() => _PuzzleGridState();
}

class _PuzzleGridState extends State<PuzzleGrid> {
  // constructor for a list that generates with a length of 9 elements and shuffles them.
  List<int?>? tiles;
  final List<int?> solvedTiles =
      List<int?>.generate(9, (index) => index < 8 ? index + 1 : null);

  @override
  void initState() {
    super.initState();
    tiles = List<int?>.generate(9, (index) => index < 8 ? index + 1 : null);
    GameLogic.shuffleTiles(
        tiles!); // Use the '!' operator to assert that 'tiles' is not null
  }

  bool isSolved() {
    for (int i = 0; i < tiles!.length; i++) {
      if (tiles![i] != solvedTiles[i]) {
        return false;
      }
    }
    return true;
  }

  void moveTile(int index) {
    int emptyIndex = tiles!.indexOf(null);
    if ([index - 1, index + 1, index - 3, index + 3].contains(emptyIndex)) {
      setState(() {
        tiles![emptyIndex] = tiles![index];
        tiles![index] = null;

        // Check if the puzzle is solved
        if (isSolved()) {
          showCompletionDialog();
        }
      });
    }
  }

  void showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Congratulations!"),
          content: Column(
            mainAxisSize:
                MainAxisSize.min, // Ensure the column size fits the content
            children: <Widget>[
              Image.asset('lib/assets/images/hero.png'), // Display the image
              Padding(
                padding: EdgeInsets.only(
                    top: 16), // Add some space between the image and the text
                child: Text("You've solved the puzzle!"),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: 9,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return tiles![index] != null
                  ? PuzzleTile(
                      number: tiles![index]!,
                      onTap: () => moveTile(index),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.black)),
                    );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
              'Current configuration is: ${GameLogic.isSolvable(tiles!) ? "Solvable" : "Not Solvable"}'),
        )
      ],
    );
  }
}
