import 'package:flutter/material.dart';


class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

// class _QuizPageState extends State<QuizPage> {
//   List scoreKeeper = [];
//
//   List<String> questions = [
//     'You can lead a cow down stairs but not up stairs.',
//     'Approximately one quarter of human bones are in the feet.',
//     'A slug\'s blood is green.',
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 500.0,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Flexible(
//             flex: 5,
//             child: Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Center(
//                 child: Text(
//                   'This is where the question text will go.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 25.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Padding(
//               padding: EdgeInsets.all(15.0),
//               child: TextButton(
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.red,
//                 ),
//                 child: Text(
//                   'False',
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                   ),
//                 ),
//                 onPressed: () {
//                   // The user picked false.
//                 },
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Padding(
//               padding: EdgeInsets.all(15.0),
//               child: TextButton(
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.green,
//                 ),
//                 child: Text(
//                   'True',
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                   ),
//                 ),
//                 onPressed: () {
//                   // The user picked false.
//
//                 },
//               ),
//             ),
//           ),
//           Row(
//             children: List<Widget>.from(scoreKeeper),
//
//
//           )
//         ],
//       ),
//     );
//   }
// }

class _QuizPageState extends State<QuizPage> {
  List scoreKeeper = [];
  List<String> questions = [
    'You can lead a cow downstairs but not upstairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];
  int currentQuestionIndex = 0; // Index of the current question

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = getCorrectAnswer();
    Icon icon = userAnswer == correctAnswer
        ? Icon(Icons.check, color: Colors.green)
        : Icon(Icons.close, color: Colors.red);

    setState(() {
      if (currentQuestionIndex == 0) {
        scoreKeeper = [icon];
      } else {
        scoreKeeper.add(icon);
      }

      currentQuestionIndex++;
    });
  }


  bool getCorrectAnswer() {
    // Retrieve the correct answer for the current question
    List<bool> answers = [false, true, false];
    return answers[currentQuestionIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  questions[currentQuestionIndex], // Show the current question
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkAnswer(false); // User picked False
                },
              ),

            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  'True',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true); // User picked True
                },
              ),
            ),
          ),
          Row(
            children: List<Widget>.from(scoreKeeper),
          ),
        ],
      ),
    );
  }
}

