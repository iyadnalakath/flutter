// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:english_words/english_words.dart';
//
// class WordsPage extends StatefulWidget {
//   const WordsPage({Key? key}) : super(key: key);
//
//   @override
//   State<WordsPage> createState() => _WordsPageState();
// }
//
// class _WordsPageState extends State<WordsPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     // leftDiceNumber = 2;
//     return Center(
//       child: TextButton(onPressed: (){
//         final player = AudioPlayer();
//         player.play('assets/note1.wav');
//       },child: Text('click me'),)
//     );
//
//   }
//
// }

// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'package:audioplayers/audioplayers.dart';
//
// class WordsPage extends StatefulWidget {
//   const WordsPage({Key? key}) : super(key: key);
//
//   @override
//   State<WordsPage> createState() => _WordsPageState();
// }
//
// class _WordsPageState extends State<WordsPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     // leftDiceNumber = 2;
//     return Center(
//       child: TextButton(
//         onPressed: () async {
//           // Play the audio file
//           final player = AudioPlayer();
//           await player.play('note2.wav' as Source);
//         },
//         child: Text('Play',style: TextStyle(color: Colors.red),),
//       ),
//     );
//
//   }
//
// }


import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({Key? key}) : super(key: key);

  @override
  State<WordsPage> createState() => _WordsPageState();
}

// class _WordsPageState extends State<WordsPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     // leftDiceNumber = 2;
//     return Row(
//       children: [
//       //   TextButton(
//       //   onPressed: () async {
//       //     // Play the audio file
//       //     AudioPlayer player = AudioPlayer();
//       //     player.play(AssetSource('note6.wav'));
//       //   },
//       //   child: Text('Play',style: TextStyle(color: Colors.red,backgroundColor: Colors.yellow,),),
//       //
//       // ),
//         TextButton(
//
//           onPressed: () async {
//
//             // Play the audio file
//             AudioPlayer player = AudioPlayer();
//             player.play(AssetSource('note6.wav'));
//           },
//           child: Text('Play',
//             style: TextStyle(
//               color: Colors.red,
//               backgroundColor: Colors.yellow,
//             ),
//           ),
//
//         )
//
//       ]
//     );
//
//   }
//
// }








// class _WordsPageState extends State<WordsPage> {
//   @override
//   Widget build(BuildContext context) {
//     // leftDiceNumber = 2;
//     return Row(
//       children: [
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 16),
//           width: 200, // Set the desired width
//           height: 50, // Set the desired height
//           decoration: BoxDecoration(
//             color: Colors.yellow,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: TextButton(
//             onPressed: () async {
//               // Play the audio file
//               AudioPlayer player = AudioPlayer();
//               player.play(AssetSource('note6.wav'));
//             },
//             child: Text(
//               'Play',
//               style: TextStyle(
//                 color: Colors.red,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

//
class _WordsPageState extends State<WordsPage> {

  void playSound(int soundNumber) {
    AudioPlayer player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  Flexible buildKey({required Color color, required int soundNumber}) {
    return Flexible(
      fit: FlexFit.loose, // Use FlexFit.loose for flexible children
      child: TextButton(
        onPressed: () async {
          // Play the audio file
          playSound(soundNumber);
        },
        child: Text("Play Sound"),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
      children: [
        buildKey(color: Colors.red, soundNumber: 1),
        buildKey(color: Colors.yellow, soundNumber: 2),
        buildKey(color: Colors.orange, soundNumber: 3),
        buildKey(color: Colors.green, soundNumber: 4),
        buildKey(color: Colors.black, soundNumber: 5),
        buildKey(color: Colors.white60, soundNumber: 6),
      ],
    );
  }
}





//
//
// children: [
// // Existing button
// Container(
// margin: EdgeInsets.symmetric(horizontal: 16),
// width: 200, // Set the desired width
// height: 50, // Set the desired height
// decoration: BoxDecoration(
// color: Colors.yellow,
// borderRadius: BorderRadius.circular(10),
// ),
// child: TextButton(
// onPressed: () async {
// // Play the audio file
// playSound(1);
// },
// child: Text(
// 'Play',
// style: TextStyle(
// color: Colors.red,
// ),
// ),
// ),
// ),
// SizedBox(height: 16),
// // Four buttons
// Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Container(
// margin: EdgeInsets.symmetric(horizontal: 16),
// width: 200, // Set the desired width
// height: 50, // Set the desired height
// decoration: BoxDecoration(
// color: Colors.pink,
// borderRadius: BorderRadius.circular(10),
// ),
// child: TextButton(
// onPressed: () {
// playSound(2);
// },
// child: Text(
// 'Button 1',
// style: TextStyle(
// color: Colors.white,
// ),
// ),
// ),
// ),
// SizedBox(height: 16),
// Container(
// margin: EdgeInsets.symmetric(horizontal: 16),
// width: 200, // Set the desired width
// height: 50, // Set the desired height
// decoration: BoxDecoration(
// color: Colors.red,
// borderRadius: BorderRadius.circular(10),
// ),
// child: TextButton(
// onPressed: () {
// playSound(3);
// },
// child: Text(
// 'Button 2',
// style: TextStyle(
// color: Colors.white,
// ),
// ),
// ),
// ),
// SizedBox(height: 16),
// Container(
// margin: EdgeInsets.symmetric(horizontal: 16),
// width: 200, // Set the desired width
// height: 50, // Set the desired height
// decoration: BoxDecoration(
// color: Colors.green,
// borderRadius: BorderRadius.circular(10),
// ),
// child: TextButton(
// onPressed: () {
// playSound(4);
// },
// child: Text(
// 'Button 3',
// style: TextStyle(
// color: Colors.white,
// ),
// ),
// ),
// ),
// SizedBox(height: 16),
// Container(
// margin: EdgeInsets.symmetric(horizontal: 16),
// width: 200, // Set the desired width
// height: 50, // Set the desired height
// decoration: BoxDecoration(
// color: Colors.purple,
// borderRadius: BorderRadius.circular(10),
// ),
// child: TextButton(
// onPressed: () {
// playSound(4);
// },
// child: Text(
// 'Button 4',
// style: TextStyle(
// color: Colors.white,
// ),
// ),
// ),
// ),
// SizedBox(height: 16),
// Container(
// margin: EdgeInsets.symmetric(horizontal: 16),
// width: 200, // Set the desired width
// height: 50, // Set the desired height
// decoration: BoxDecoration(
// color: Colors.black87,
// borderRadius: BorderRadius.circular(10),
// ),
// child: TextButton(
// onPressed: () {
// playSound(5);
// },
// child: Text(
// 'Button 6',
// style: TextStyle(
// color: Colors.white,
// ),
// ),
// ),