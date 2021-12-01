import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  //initial state
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void rollTheDice() {
    setState(() => {
          leftDiceNumber = Random().nextInt(6) + 1,
          rightDiceNumber = Random().nextInt(6) + 1
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              child: TextButton(
            child: Image.asset('images/dice$leftDiceNumber.png'),
            onPressed: () => { rollTheDice() },
            //the reason we are using setState method to set as it will cal the build method again to update the state
          )),
          Expanded(
              child: TextButton(
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                   onPressed: () => { rollTheDice() },
                  ),
                 
                  )
        ],
      ),
    );
  }
}
