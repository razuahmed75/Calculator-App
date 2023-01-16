import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor, textColor;
  final void Function()? buttonTapped;

  const MyButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.buttonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: backgroundColor,
      onPressed: buttonTapped,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
