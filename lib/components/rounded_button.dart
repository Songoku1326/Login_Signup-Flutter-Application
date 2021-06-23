import 'package:flutter/material.dart';
import 'package:task3/constants.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;

  const RoundButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green[700],
              onPrimary: color, // foreground
            ),
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat",
                fontSize: size.height * 0.025,
                color: textColor,
              ),
            ),
          )),
    );
  }
}
