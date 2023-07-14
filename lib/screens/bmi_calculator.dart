import 'package:dice/components/calculator_brain.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import '../components/icon_content.dart';
import '../components/reusable_cart.dart';
import '../utilities/constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';



enum Gender {
  male,
  female
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Gender selectedGender = Gender.male;
  int height = 130;
  int weight = 60;
  int age = 35;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            thumbColor: Color(0xFFEB1555),
            overlayColor: Color(0x15EB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0)
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    // child: GestureDetector(
                    //   onTap: () {
                    //     setState(() {
                    //       selectedGender = Gender.male;
                    //     });
                    //   },
                      child: ReusableCard(
                        onPress: (){
                              setState(() {
                                selectedGender = Gender.male;
                              });
                        },
                         colour: selectedGender == Gender.male
                            ? kCardColor
                            : kInactiveCardColor,
                        cardChild:
                        IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                      ),
                    // ),
                  ),
                  Expanded(
                    // child: GestureDetector(
                    //   onTap: () {
                    //     setState(() {
                    //       selectedGender = Gender.female;
                    //     });
                    //   },
                      child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? kCardColor
                            : kInactiveCardColor,
                        cardChild:
                        IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      ),
                    // ),
                  ),
                ],
              ),
            ),
            Expanded(child: ReusableCard(colour: kCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hieght',style: kLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                        Text(height.toString(),style: kNumberTextStyle,),
                    Text('cm',
                    style: kLabelTextStyle,)
                  ],
                  
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x15EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0)
                  ),
                  child: Slider(value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      // activeColor: Colors.white,
                      onChanged: (double newValue){
                        setState(() {
                          height=newValue.round();
                        });

                      }),
                ),
              ],
            ),)),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: ReusableCard(
                    colour: kCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                        style: kLabelTextStyle,),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                            onPressed: (){
                                setState(() {
                                  weight++;
                                });
                            },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },),
                          ],
                        ),
                      ],
                    ),)),
                  Expanded(child: ReusableCard(

                    colour: kCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },),
                          ],
                        ),
                      ],
                    ),)),
                ],
              ),
            ),
            BottomButton(buttonTitle: 'CALCULATE',onTap:  () {
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResults(),
                  interpretation: calc.getInterpretation(),
                ),
                ),
              );
            },),
          ],
        ),
      ),
    );
  }
}




// enum Gender {
//   male,
//   female
// }
//
// class BMICalculator extends StatefulWidget {
//   const BMICalculator({Key? key}) : super(key: key);
//
//   @override
//   State<BMICalculator> createState() => _BMICalculatorState();
// }
//
//
//
// class _BMICalculatorState extends State<BMICalculator> {
//
//   // Gender selectedGender;
//   Gender selectedGender = Gender.male;
//
//
//
//   // Color maleCardColour = inactiveCardColor;
//   // Color femaleCardColour = inactiveCardColor;
//   //
//   // // 1= male, 2= female
//   // void updateColour(Gender selectedGender){
//   //   Gender genderType;
//   //
//   //   if (selectedGender==Gender.male){
//   //     if(maleCardColour == inactiveCardColor){
//   //       maleCardColour = cardColor;
//   //       femaleCardColour = inactiveCardColor;
//   //     }else{
//   //       maleCardColour = inactiveCardColor;
//   //     }
//   //   }
//   // //  female
//   //   if (selectedGender==Gender.female){
//   //     if(femaleCardColour == inactiveCardColor){
//   //       femaleCardColour = cardColor;
//   //       maleCardColour = inactiveCardColor;
//   //     }else{
//   //       femaleCardColour = inactiveCardColor;
//   //     }
//   //   }
//   // }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark().copyWith(
//         // ThemeData(
//           appBarTheme: AppBarTheme(
//             backgroundColor: Color(0xFF0A0E21),
//             // Set the custom color for AppBar
//           ),
//           scaffoldBackgroundColor:Color(0xFF0A0E21),
//           textTheme: TextTheme(bodyMedium:TextStyle(color: Colors.white),),
//         ),
//       // )
//       home: Scaffold(
//         // backgroundColor: Color(0x0A0F31DD),
//         appBar: AppBar(
//           title: Text('BMI CALCULATOR'),
//         ),
//         body: Column(
//           children: [
//
//             Expanded(child: Row(
//               children: [
//                 Expanded(child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         // updateColour(1);
//                         print('sssss');
//                         // updateColour(Gender.male);
//                         selectedGender=Gender.male;
//                       });
//                     },
//
//         child: ReusableCard(colour:selectedGender==Gender.male ? cardColor: inactiveCardColor,cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE'),))
//                 ,),
//                 Expanded(child: GestureDetector(
//                 onTap: () {
//                 setState(() {
//                 // updateColour(1);
//                 print('lll');
//                 // updateColour(Gender.female);
//                 selectedGender=Gender.female;
//                 });
//                 },child: ReusableCard(colour:selectedGender==Gender.female ? inactiveCardColor: cardColor,cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE'),),),)
//                 ],
//                 )),
//                 Expanded(child: ReusableCard(colour:cardColor)),
//                 Expanded(child: Row(
//                 children: [
//                 Expanded(child: ReusableCard(colour:cardColor)),
//                 Expanded(child: ReusableCard(colour:cardColor)),
//               ],
//             )),
//             Container(
//               color: bottomContainerColor,
//               margin: EdgeInsets.only(top: 10),
//               width: double.infinity,
//               height: bottomContainerHeight,
//             )
//
//           ],
//         )
//       ),
//     );
//   }
// }


// class ReusableCard extends StatelessWidget {
//   // const ReusableCard({
//   //   super.key,
//   // });
//   ReusableCard({required this.colour});
//   Color colour;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//       margin: EdgeInsets.all(15),
//       decoration: BoxDecoration(
//           color: colour,
//           borderRadius: BorderRadius.circular(10)
//       ),
//
//     );
//   }
// }

// Color _currentColor = cardColor;
//
// void _handleTap() {
//   setState(() {
//     _currentColor = _currentColor == cardColor ? Color(0xFF111328) : cardColor;
//   });
// }


// Container(
//
// margin: EdgeInsets.all(15),
// decoration: BoxDecoration(
// color: Color(0xFF1D1E33),
// borderRadius: BorderRadius.circular(10)
// ),
// height: 200.0,
// width: 170.0,
// )