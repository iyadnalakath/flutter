import 'package:flutter/material.dart';
import '../utilities/constants.dart';



class BottomButton extends StatelessWidget {

  BottomButton({required this.onTap, required this.buttonTitle});

  final void Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(buttonTitle,style: kLargeButtonTextStyle,),
        padding: EdgeInsets.only(bottom: 20.0),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
