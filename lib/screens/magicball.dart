import 'package:flutter/material.dart';
import 'dart:math';


class MagicBallPage extends StatefulWidget {
  const MagicBallPage({Key? key}) : super(key: key);

  @override
  State<MagicBallPage> createState() => _DicePageState();
}

class _DicePageState extends State<MagicBallPage> {
  // DicePage({super.key}) async {
  //   // TODO: implement DicePage
  //   throw UnimplementedError();
  // }
  int magicBallNumber = 1;

  void magicBall() {
    setState(() {
      magicBallNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // leftDiceNumber = 2;
    return Center(
      child: Row(
        children: [
          Expanded(
            child:
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: magicBall,

                // Do something when the button is pressed.

                child: Image.asset('images/ball$magicBallNumber.png'),

              ),
            ),
          ),


        ],
      ),
    );
  }

}

