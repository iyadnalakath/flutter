import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../components/reusable_cart.dart';
import '../components/bottom_button.dart';


class ResultsPage extends StatelessWidget {

  // const ResultsPage({Key? key}) : super(key: key);
  ResultsPage({ required this.resultText,required this.interpretation,required this.bmiResult,});

  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result',
            style: kTitleTextStyle,),
          ),),
          Expanded(flex: 5,
          child: ReusableCard(colour: kCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(resultText.toLowerCase(),
                style: kResultTextStyle,
              ),
              Text(bmiResult,
              style: kBmiTextStyle,),
              Text(interpretation,
              style: kBodyTextStyle,
              textAlign: TextAlign.center,)
            ],

          ),),),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',

            ),

        ],
      ),
    );
  }
}
