import 'package:flutter/material.dart';

//It got inspired from a FloatingActionButton, it is created from a rawmaterialbutton, therefore, i can see how it was created and reproduce it
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  RoundIconButton({this.icon, this.onPress});
  Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      elevation: 6.0,
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}
