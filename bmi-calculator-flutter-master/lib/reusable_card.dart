import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  //this constructor works only for positions on the screen, therefore, is useless here, i require to create my own constructor
  // const ReusableCard({Key key, }) : super(key: key);

  ReusableCard(
      {@required this.colour,
      this.cardChild,
      this.onPress}); //@required this.colour

  //This class is marked as inmutable. I required to set color as final.
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
