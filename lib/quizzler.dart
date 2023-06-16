import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

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
  List<Icon> scoreKeeper = [];

  // List<String> questions = [
  //   'You can lead a cow downstairs but not upstairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];


  // Index of the current question

  // void checkAnswer(bool userAnswer) {
  //   setState(() {
  //     quizBrain.nextQuestion();
  //   });
  // }

  void showQuizEndAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz End'),
          content: Text('All questions have been answered.'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                setState(() {
                  scoreKeeper.clear();
                  quizBrain.reset(); // Call the reset method
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void checkAnswer(bool userAnswer) {
    setState(() {
      // quizBrain.nextQuestion();

      if (quizBrain.isFinished()) {
        // Show the alert box when all questions have been answered
        showQuizEndAlert(context);
      }
      else {
        quizBrain.nextQuestion();
      }
    });
  }

  // void checkCorrectAnswer(bool userPickedAnswer){
  //   bool correctAnswer = quizBrain.getQuestionAnswer();
  //   if (userPickedAnswer == correctAnswer ){
  //     print('user got it right');
  //   }
  //   else {
  //     print('user got it wrong');
  //   }
  //
  //   checkAnswer(false);
  // }

  // List<bool> answers = [
  //   false,
  //   true,
  //   true
  // ];
  //
  // Question q1 = Question(q: 'You can lead a cow downstairs but not upstairs.', a: false);
  //






  void checkCorrectAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    IconData icon;
    Color iconColor;

    // if (userPickedAnswer == correctAnswer) {
    //   print('user got it right');
    //   icon = Icons.check; // Tick icon
    //   iconColor = Colors.green;
    // } else {
    //   print('user got it wrong');
    //   icon = Icons.close; // Cross icon
    //   iconColor = Colors.red;
    // }

    setState(() {
      // scoreKeeper.add(
      //   Icon(
      //     icon,
      //     color: iconColor,
      //   ),
      // );
      // quizBrain.nextQuestion();
      checkAnswer(userPickedAnswer);
      if (userPickedAnswer == correctAnswer) {
        print('user got it right');
        icon = Icons.check; // Tick icon
        iconColor = Colors.green;
      } else {
        print('user got it wrong');
        icon = Icons.close; // Cross icon
        iconColor = Colors.red;
      }
      scoreKeeper.add(
        Icon(
          icon,
          color: iconColor,
        ),
      );

    });
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
                  quizBrain.getQuestionText(), // Show the current question
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
                  checkCorrectAnswer(false);
                  // User picked False
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
                  checkCorrectAnswer(true);
                },
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}