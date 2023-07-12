import 'package:flutter/material.dart';


// class ReusableCard extends StatelessWidget {
//   const ReusableCard({required this.colour,this.cardChild}); // Add 'const' keyword here
//
//   final Color colour;
//   final Widget ? cardChild;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: cardChild,
//       margin: EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: colour,
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
// }


class ReusableCard extends StatefulWidget {
  const ReusableCard({required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget? cardChild;
  // final Function? onPress;
  final void Function()? onPress; // Update the type of onPress

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress, // Use widget.onPress instead of onPress
      child: Container(
        child: widget.cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: widget.colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}