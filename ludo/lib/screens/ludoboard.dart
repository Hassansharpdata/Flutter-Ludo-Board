import 'package:flutter/material.dart';

class LudoScreen1 extends StatelessWidget {
  const LudoScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ludo Game"),
          backgroundColor: Colors.amber,
          toolbarHeight: 100,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 89, 166, 172), width: 1),
            ),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 15, // Ludo board is 15x15 grid
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: _getColor(index),
                          border: Border.all(
                              color: const Color.fromARGB(255, 22, 22, 22)),
                        ),
                      );
                    },
                    itemCount: 225, // Total tiles in 15x15 grid
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       // Dice roll logic can be added here
                //     },
                //     child: const Text('Roll Dice'),
                //     style: ElevatedButton.styleFrom(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 50, vertical: 20),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }

  // Define the layout and colors for different areas of the Ludo board
  Color _getColor(int index) {
    int row = index ~/ 15; // Get row index (0-14)
    int col = index % 15; // Get column index (0-14)

    // Define the home areas
    if (row < 6 && col < 6) {
      return const Color.fromARGB(255, 45, 219, 50); // Green Home
    }
    if (row < 6 && col > 8) {
      return Colors.yellow; // Yellow Home
    }
    if (row > 8 && col < 6) {
      return Colors.red; // Red Home
    }
    if (row > 8 && col > 8) {
      return Colors.blue; // Blue Home
    }

    // Center area of the board (3x3 black grid)
    if (row >= 6 && row <= 8 && col >= 6 && col <= 8) {
      return const Color.fromARGB(255, 228, 14, 14); // Set center to black
    }

    // Safe zone middle lines for each color (change to indigo)
    if (_isMiddleLine(row, col)) {
      return const Color.fromARGB(
          255, 181, 126, 63); // Set middle line safe zones to indigo
    }

    // Safe zones (with stars) in paths (you can customize positions)
    if (_isSafeZone(row, col)) {
      return Colors.blue;
    }

    // Path zones
    return Colors.white;
  }

  bool _isMiddleLine(int row, int col) {
    // Define middle line for each path to the center (safe zones)
    return (col == 7 && row < 6) || // Green vertical middle line
        (row == 7 && col < 6) || // Red horizontal middle line
        (col == 7 && row > 8) || // Yellow vertical middle line
        (row == 7 && col > 8); // Blue horizontal middle line
  }

  // Logic for special tiles like safe zones (stars)
  bool _isSafeZone(int row, int col) {
    List<List<int>> safeZones = [
      [1, 6], [6, 1], [8, 13], [13, 8], // entrance arrows or key safe zones
      [2, 8], [8, 2], [12, 6], [6, 12] // other safe positions
    ];
    for (var zone in safeZones) {
      if (zone[0] == row && zone[1] == col) {
        return true;
      }
    }
    return false;
  }
}
