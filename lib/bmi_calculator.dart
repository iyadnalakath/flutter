import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF0A0E21),
            // Set the custom color for AppBar
          ),
          scaffoldBackgroundColor:Color(0xFF0A0E21),
          textTheme: TextTheme(bodyMedium:TextStyle(color: Colors.white)),
        ),
      // )
      home: Scaffold(
        // backgroundColor: Color(0x0A0F31DD),
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Center(
          child: Text('Body Text'),
        ),
        // floatingActionButton: Theme(
        //   data: ThemeData.light(),
        //   child: FloatingActionButton(
        //     child: Icon(Icons.add),
        //     onPressed: () {
        //       // Define the action to be performed when the button is pressed
        //       // For example, you can display a message when the button is pressed
        //       print('Button pressed!');
        //     },
        //   ),
        // ),
      ),
    );
  }
}
