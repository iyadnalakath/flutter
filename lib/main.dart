import 'package:flutter/material.dart';
import 'dart:math';
import 'magicball.dart';
import 'words.dart';
import 'quizzler.dart';
import 'story.dart';
import 'bmi_calculator.dart';



// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blueAccent,
//         appBar: AppBar(
//           title: const Text('Dicee'),
//           backgroundColor: Colors.blueAccent.shade700,
//         ),
//         body: ListView.builder(
//           itemCount: 3,
//           itemBuilder: (context, index) {
//             return index == 0 ? DicePage() : index == 1 ? MagicBallPage() : WordsPage() ;
//           },
//         ),
//       ),
//     ),
//   );
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blueAccent,
//         appBar: AppBar(
//           title: const Text('Dicee'),
//           backgroundColor: Colors.blueAccent.shade700,
//         ),
//         body: ListView.builder(
//           itemCount: 4,
//           itemBuilder: (context, index) {
//             if (index == 0) {
//               return DicePage();
//             } else if (index == 1) {
//               return MagicBallPage();
//             } else if (index == 2) {
//               return WordsPage();
//             } else {
//               return QuizPage();
//             }
//           },
//         ),
//       ),
//     ),
//   );
// }

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.blueAccent.shade700,
        ),
        body: ListView.builder(
          itemCount: 6, // Increased the itemCount to accommodate the button
          itemBuilder: (context, index) {
            if (index == 0) {
              return DicePage();
            } else if (index == 1) {
              return MagicBallPage();
            } else if (index == 2) {
              return WordsPage();
            } else if (index == 3){
              return ElevatedButton(
                child: Text('Go to Quiz Page'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage()),
                  );
                },
              );
            } else if (index == 4){
              return ElevatedButton(
                child: Text('Go to BMI Calculator'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BMICalculator()),
                  );
                },
              );
            }else {
            return ElevatedButton(
            child: Text('Go to Story  Page'),
            onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StoryPage()),
            );
            },
            );
            }
          },
        ),
      ),
    ),
  );
}


class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // DicePage({super.key}) async {
  //   // TODO: implement DicePage
  //   throw UnimplementedError();
  // }
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // leftDiceNumber = 2;
    return Center(
      child: Row(
        children: [
          Expanded(
// height: 200,
//             width: double.infinity,
            child:
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: rollDice,

                  // Do something when the button is pressed.

                child: Image.asset('images/dice$leftDiceNumber.png'),

              ),
            ),
          ),

          Expanded(child:
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: rollDice,
              child: Image.asset('images/dice$rightDiceNumber.png'),

            ),
          ),)
        ],
      ),
    );
  }

}








// class DicePage extends StatelessWidget {
//   DicePage({super.key});
//   int leftDiceNumber = 6;
//   @override
//   Widget build(BuildContext context) {
//     leftDiceNumber = 2;
//     return Center(
//       child: Row(
//         children: [
//           Expanded(
//             child:
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextButton(
//                 child: Image.asset('images/dice$leftDiceNumber.png'),
//                 onPressed: () {
//                   print('dfdsfdfds');
//                   // Do something when the button is pressed.
//                 },
//               ),
//             ),
//           ),
//           Expanded(child:
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Image.asset('images/dice4.png'),
//           ),)
//         ],
//       ),
//     );
//   }
//
//
// }
//





// MagicBallPage magicBallPage = MagicBallPage();
// void main() {
//   return runApp(
//     MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.red,
//         appBar: AppBar(
//           title: const Text('Dicee'),
//           backgroundColor: Colors.red,
//         ),
//         body: DicePage(),
//
//       ),
//     ),
//   );
// }


// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blueAccent,
//         appBar: AppBar(
//           title: const Text('Dicee'),
//           backgroundColor: Colors.blueAccent.shade700,
//         ),
//         body:ListView(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             DicePage(),
//             DicePage(),
//             DicePage(),
//             MagicBallPage(),
//             WordsPage()
//           ],
//         ),
//       ),
//     ),
//   );
// }
//