class GameLogic {
  // Generates a list of 9 tiles with one empty space (null)
  static List<int?> generateTiles() {
    List<int?> tiles =
        List<int?>.generate(9, (index) => index < 8 ? index + 1 : null);
    return tiles;
  }

  // Shuffles the tiles until a solvable configuration is achieved.
  static void shuffleTiles(List<int?> tiles) {
    do {
      tiles.shuffle();
    } while (!isSolvable(tiles));
  }

  // Counts the number of inversions in tile list to check if the puzzle is solvable.

  static int countInversions(List<int?> tiles) {
    int inversions = 0;

    // Filter out null values and ensure the list contains only non-nullable integers
    List<int> tileList =
        tiles.where((tile) => tile != null).cast<int>().toList();

    for (int i = 0; i < tileList.length; i++) {
      for (int j = i + 1; j < tileList.length; j++) {
        if (tileList[i] > tileList[j]) {
          inversions++;
        }
      }
    }
    return inversions;
  }

// Determines if the list of tiles represents a solvable puzzle.
  static bool isSolvable(List<int?> tiles) {
    int inversions = countInversions(tiles);
    return inversions % 2 == 0; // Solvable if inversions are even.
  }
}
