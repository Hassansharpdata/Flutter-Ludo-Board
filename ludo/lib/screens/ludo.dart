import 'package:flutter/material.dart';

class LudoScreen extends StatelessWidget {
  const LudoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ludo Game"),
          backgroundColor: Colors.amber,
          toolbarHeight: 50,
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: Icon(Icons.add),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: _getColor(index),
                        border: Border.all(color: Colors.black),
                      ),
                    );
                  },
                  itemCount: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Dice roll logic can be added here
                  },
                  child: Text('Roll Dice'),
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.red,
                    // onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Color _getColor(int index) {
    // Example color logic based on index
    if (index < 20) return Colors.green;
    if (index < 40) return Colors.red;
    if (index < 60) return Colors.yellow;
    if (index < 80) return Colors.blue;
    return Colors.white;
  }
}

Widget customContainer(height, width, color) {
  return Container(
    height: height,
    width: width,
    color: color,
  );
}
